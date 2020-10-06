//
//  UIButtonExtension.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/05.
//

import UIKit

//丸いボタンを作成します（ボーダー付き）
class CircleButton:UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    private func commonInit() {
        //角丸・枠線・背景色を設定する
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    
}
