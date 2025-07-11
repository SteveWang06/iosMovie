//
//  LoginViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
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

