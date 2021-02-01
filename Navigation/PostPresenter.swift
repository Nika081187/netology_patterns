//
//  PostPresenter.swift
//  Navigation
//
//  Created by v.milchakova on 01.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class PostPresenter: FeedViewOutput {
    
    var navController: UINavigationController?
    
    init(nav: UINavigationController) {
        self.navController = nav
    }
    
    func showPost() {
        let vc = PostViewController()
        navController?.pushViewController(vc, animated: false)
    }
}
