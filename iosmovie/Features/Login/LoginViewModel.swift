//
//  LoginViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = "test@example.com"
    @Published var password: String = "123456"
    @Published var errorMessage: String?

    func login(appState: AppState) {
        if LoginModel.authenticate(email: email, password: password) {
            TokenManager.saveToken(APIConstants.accessToken)
            appState.login()
        } else {
            errorMessage = "Email hoặc mật khẩu không đúng"
        }
    }
}

