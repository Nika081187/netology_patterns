//
//  FeedNavigationViewController.swift
//  Navigation
//
//  Created by v.milchakova on 13.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class FeedNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let postPresenter = PostPresenter(nav: self)
        let feed = FeedViewController()
        feed.output = PostPresenter(nav: self)
        pushViewController(feed, animated: true)
    }
}
