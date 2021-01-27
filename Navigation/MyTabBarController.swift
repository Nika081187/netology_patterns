//
//  MyTabBarController.swift
//  Navigation
//
//  Created by v.milchakova on 11.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [FeedNavigationViewController(), ProfileNavigationViewController()]
    }
}
