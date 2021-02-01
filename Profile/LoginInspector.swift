//
//  CredentialsChecker.swift
//  Navigation
//
//  Created by v.milchakova on 27.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    
    func checkLogin(login: String, completion: (Bool) -> Void) {
        completion(login == Checker.checker.login)
    }
    
    func checkPassword(password: String, completion: (Bool) -> Void) {
        completion(password == Checker.checker.password)
    }
}
