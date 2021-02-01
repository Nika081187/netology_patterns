//
//  CredentialsChecker.swift
//  Navigation
//
//  Created by v.milchakova on 27.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    
    func checkLogin(completion: (String) -> Bool) -> Bool {
       return completion("123")
    }
    
    func checkPassword(completion: (String) -> Bool) -> Bool {
        return completion("123")
    }
}
