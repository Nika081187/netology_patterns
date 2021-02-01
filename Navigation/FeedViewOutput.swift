//
//  FeedViewOutput.swift
//  Navigation
//
//  Created by v.milchakova on 01.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol FeedViewOutput: class {
    var navController: UINavigationController? { get set }
    
    func showPost()
}
