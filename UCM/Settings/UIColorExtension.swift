//
//  UIColorExtension.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/04.
//


import UIKit

//色をRGBで調節をすることができます
extension UIColor{
    static func lightrgb(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor{
        return self.init(red: r/255, green: g/255, blue: b/255, alpha: 0.8)
    }
}

let Lblue = UIColor.lightrgb(r: 246, g: 250, b: 246)
let Dblue = UIColor.lightrgb(r: 90, g: 161, b: 216)
let LGreen = UIColor.lightrgb(r: 172, g: 220, b: 227)
