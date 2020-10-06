//
//  TimeSettingViewController.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/04.
//

import UIKit
import EventKit

//TimeTableViewCellDelegateにおけるプロトコル宣言
protocol TimeTableViewCellDelegate {
    func sendTime(cell:TimeTableViewCell)
    func button(cell:ButtonTimeTableViewCell)
}


class TimeSettingViewController: UIViewController {

    @IBOutlet weak var timeTableView: UITableView!
    let timecellId = "TimeCell"
    let buttonCellId = "ButtonCell"
    var starTime = ["00:00"]
    var endTime = ["00:00"]
    
    let eventStore = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTableView.delegate = self
        timeTableView.dataSource = self
        timeTableView.tableFooterView = UIView(frame: .zero)
        CheckCalendar().allowAuthorization()
    }
    
//    現在取得できている時間割を保存する
    @IBAction func saveButton(_ sender: Any) {
        performSegue(withIdentifier: "classify", sender: nil)
        print("Start:\(starTime),End:\(endTime)")
    }
}

//  TimeSettingViewController DelegateとDataSourceの設定を行う
extension TimeSettingViewController:UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout{
    
//    セルの高さ設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == starTime.count{
            return 60
        }else{
            return 80
        }
    }
    
//    セル数の調整
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starTime.count + 1
    }
    
//    セル内容の設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == starTime.count{
            
//      timeTableViewにおけるButtonTimeTableViewCellの内容との連携
            let cell = timeTableView.dequeueReusableCell(withIdentifier: buttonCellId) as! ButtonTimeTableViewCell
            cell.timeTableViewCellDelegate = self
            
//            ボタンを使えないようにするための設定
            if starTime.count == 6{
                cell.addButton.isEnabled = false
                cell.addButton.alpha = 0.3
            }else if starTime.count == 1{
                cell.removeButton.isEnabled = false
                cell.removeButton.alpha = 0.3
            }else{
                cell.addButton.isEnabled = true
                cell.addButton.alpha = 1.0
                cell.removeButton.isEnabled = true
                cell.removeButton.alpha = 1.0
            }
            return cell
            
        }else{
            
//      timeTableViewにおけるTimeTableViewCellの内容との連携
            let cell = timeTableView.dequeueReusableCell(withIdentifier: timecellId,for:indexPath) as! TimeTableViewCell
            cell.classNumber.text = String(indexPath.row + 1)
            cell.startTime.date = TimeUtils.timeFromString(string: starTime[indexPath.row])
            cell.endTime.date = TimeUtils.timeFromString(string: endTime[indexPath.row])
            cell.timeTableViewCellDelegate = self
            print(starTime,endTime)
            return cell
        }
        

    }
    
//    横スワイプによる削除をできないようにする
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
}

extension TimeSettingViewController:TimeTableViewCellDelegate{
    func sendTime(cell: TimeTableViewCell) {
        guard let number = self.timeTableView.indexPath(for: cell)?.row else{return}
        starTime[number] = TimeUtils.stringFromTime(date: cell.startTime.date)
        endTime[number] = TimeUtils.stringFromTime(date: cell.endTime.date)
        
        if cell.startTime.date > cell.endTime.date{
            cell.endTime.date = cell.startTime.date
        }
    }
    
    func button(cell: ButtonTimeTableViewCell) {
        guard let number = self.timeTableView.indexPath(for: cell)?.row else{return}
        if cell.actionNum == 0{
            starTime.append(endTime[number-1])
            endTime.append(endTime[number-1])
        }else{
            starTime.removeLast()
            endTime.removeLast()
        }
        timeTableView.reloadData()
    }

}










class CheckCalendar{
    let eventStore = EKEventStore()
    func allowAuthorization() {
        if getAuthorization_status() {
            // 許可されている
            return
        } else {
            // 許可されていない
            eventStore.requestAccess(to: .event, completion: {
            (granted, error) in
                if granted {
                    return
                }
                else {
                    print("Not allowed")
                }
            })

        }
    }

    // 認証ステータスを確認する
    func getAuthorization_status() -> Bool {
        // 認証ステータスを取得
        let status = EKEventStore.authorizationStatus(for: .event)
        // ステータスを表示 許可されている場合のみtrueを返す
        switch status {
        case .notDetermined:
            print("NotDetermined")
            return false

        case .denied:
            print("Denied")
            return false

        case .authorized:
            print("Authorized")
            return true

        case .restricted:
            print("Restricted")
            return false
        @unknown default:
            return false
        }
    }
    
}



