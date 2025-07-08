//
//  LoginModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import Foundation

struct User {
    let email: String
    let password: String
}

struct LoginModel {
    static let mockUser = User(email: "test@example.com", password: "123456")

    static func authenticate(email: String, password: String) -> Bool {
        return email.lowercased() == mockUser.email && password == mockUser.password
    }
}
