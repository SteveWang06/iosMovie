//
//  AppState.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//


import Foundation

enum AuthStatus {
    case loading
    case loggedIn
    case loggedOut
}

class AppState: ObservableObject {
    @Published var authStatus: AuthStatus = .loading

    init() {
        checkLoginStatus()
    }

    func checkLoginStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            // Giả lập kiểm tra đăng nhập
            // Sau này có thể check UserDefaults/session/token tại đây
            let isLoggedIn = false
            self.authStatus = isLoggedIn ? .loggedIn : .loggedOut
        }
    }

    func login() {
        authStatus = .loggedIn
    }

    func logout() {
        authStatus = .loggedOut
    }
}

