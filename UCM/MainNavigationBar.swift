//
//  MainNavigationBar.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/04.
//

import UIKit

class MainNavigationBar: UINavigationBar {
    let barHeight: CGFloat = 100

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: barHeight)
    }
}
