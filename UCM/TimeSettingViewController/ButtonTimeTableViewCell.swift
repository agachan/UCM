//
//  ButtonTimeTableViewCell.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/05.
//

import UIKit

class ButtonTimeTableViewCell:UITableViewCell{
    
    var timeTableViewCellDelegate:TimeTableViewCellDelegate?
    enum buttonTag:Int {
        case action0 = 0
        case action1 = 1
    }
    var actionNum = 0
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBAction func button(_ sender: Any) {
        if let button = sender as? UIButton{
            if let tag = buttonTag(rawValue: button.tag){
                switch tag {
                case .action0:
                    actionNum = 0
                    timeTableViewCellDelegate?.button(cell: self)
                case .action1:
                    actionNum = 1
                    timeTableViewCellDelegate?.button(cell: self)
                }
            }
        }
        
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
