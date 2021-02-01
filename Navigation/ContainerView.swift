//
//  ContainerView.swift
//  Navigation
//
//  Created by v.milchakova on 30.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ContainerView: UIView {
    
    typealias onTapHandler = (() -> Void)

    var onTap: onTapHandler?
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show Post", for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.addTarget(self, action: #selector(firstButtonPressed), for:.touchUpInside)
        button.layer.cornerRadius = 15
        button.toAutoLayout()
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.setTitle("Show Post", for: .normal)
        button2.backgroundColor = UIColor.green
        button2.addTarget(self, action: #selector(secondButtonPressed), for:.touchUpInside)
        button2.layer.cornerRadius = 15
        button2.toAutoLayout()
        return button2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        addSubview(button2)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder!")
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc private func firstButtonPressed() {
        print("First button pressed")
        guard let tap = onTap else {
            return
        }
        tap()
    }
    
    @objc private func secondButtonPressed() {
        print("Second button pressed")
        guard let tap = onTap else {
            return
        }
        tap()
    }
}
