//
//  TimeTableViewCell.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/05.
//

import UIKit
class TimeTableViewCell:UITableViewCell{
    
    var timeTableViewCellDelegate:TimeTableViewCellDelegate?
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var classNumber: UILabel!
    var start = ""
    var end = ""
    
    enum timeTag:Int {
        case action0 = 0
        case action1 = 1
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowRadius = 4
    }
    @IBAction func time(_ sender: Any) {
        timeTableViewCellDelegate?.sendTime(cell: self)
        if let time = sender as? UIDatePicker{
            if let tag = timeTag(rawValue: time.tag){
                switch tag {
                case .action0:
                    start = TimeUtils.stringFromTime(date: startTime.date)
                case .action1:
                    end = TimeUtils.stringFromTime(date: endTime.date)
                }
            }
        }
        
    }
    
}
