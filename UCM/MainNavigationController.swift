//
//  MainNavigationController.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/04.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
    }

}

extension UIColor{
    static func rgb(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor{
        return self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
}
