//
//  ModerTabBarController.swift
//  Moder
//
//  Created by Leqi Long on 11/3/16.
//  Copyright © 2016 TeamAwesome. All rights reserved.
//

import UIKit

class ModerTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor(red:0.22, green:0.69, blue:0.40, alpha:1.0)
        UITabBar.appearance().barTintColor = UIColor(red:0.95, green:0.95, blue:0.96, alpha:1.0)
    }
}
