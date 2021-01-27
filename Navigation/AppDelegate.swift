//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        window?.rootViewController = UINavigationController(rootViewController: MyTabBarController())
        
        window?.makeKeyAndVisible()
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(
          UIApplication.backgroundFetchIntervalMinimum)
        
        return true
    }
    
    func application(
      _ application: UIApplication,
      performFetchWithCompletionHandler
        completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

      if let tabBarController = window?.rootViewController as? UITabBarController,
        let viewControllers = tabBarController.viewControllers {

        for viewController in viewControllers {
          if let fetchViewController = viewController as? FetchViewController {

            fetchViewController.fetch {

              fetchViewController.updateUI()
              completionHandler(.newData)
            }
          }
        }
      }
    }

}

