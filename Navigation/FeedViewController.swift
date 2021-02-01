//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class FeedViewController: UIViewController {
    
    var output: FeedViewOutput? = nil

    var date = Date()
    var calendar = Calendar.current
    var hour = 0
    var minutes = 0
    var second = 0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(type(of: self), #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        date = Date()
        calendar = Calendar.current
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        second = calendar.component(.second, from: date)
        
        print("viewDidLoad: \(hour) \(minutes) \(second)")
        
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            self.date = Date()
            self.calendar = Calendar.current
            self.hour = self.calendar.component(.hour, from: self.date)
            self.minutes = self.calendar.component(.minute, from: self.date)
            self.second = self.calendar.component(.second, from: self.date)
            print("Активирован бекграунд режим! \(self.hour) \(self.minutes) \(self.second)")
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        
        view.backgroundColor = .blue
        print(type(of: self), #function)
        title = "Feed"
        
        let containerView = ContainerView()
        containerView.toAutoLayout()
        containerView.onTap = {
            guard let output = self.output else {
                return
            }
            output.showPost()
            print("onTap")
        }

        view.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func applicationDidBecomeActive(notification: NSNotification) {
        date = Date()
        calendar = Calendar.current
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        second = calendar.component(.second, from: date)
        print("Приложение активировано! \(hour) \(minutes) \(second)")
    }
}
