//
//  Checker.swift
//  Navigation
//
//  Created by v.milchakova on 27.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class Checker {
    let login = "login"
    let password = "password"
    weak var delegate: LoginViewControllerDelegate?
    
    static let checker: Checker = {
        let instance = Checker()
        return instance
    }()
    
    private init() {}
    
    func checkLoginAndPassword(login: String, password: String) -> Bool {
        var res = true
        delegate?.checkLogin(login: login, completion: { (result) in
            res = res && result
        })
        delegate?.checkPassword(password: password, completion: { (result) in
            res = res && result
        })
        return res
    }
}
