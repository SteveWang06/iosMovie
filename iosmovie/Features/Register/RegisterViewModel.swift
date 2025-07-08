//
//  RegisterViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?

    func register(completion: @escaping (Bool) -> Void) {
        let request = RegisterRequest(
            fullName: fullName,
            email: email,
            password: password,
            confirmPassword: confirmPassword
        )

        RegisterModel.register(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.errorMessage = nil
                    completion(true)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    completion(false)
                }
            }
        }
    }
}
