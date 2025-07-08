//
//  RegisterModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import Foundation

// MARK: - Request Model
struct RegisterRequest {
    let fullName: String
    let email: String
    let password: String
    let confirmPassword: String
}

// MARK: - Register Error Enum
enum RegisterError: LocalizedError {
    case emptyFields
    case invalidEmail
    case passwordTooShort
    case passwordMismatch

    var errorDescription: String? {
        switch self {
        case .emptyFields:
            return "Vui lòng điền đầy đủ thông tin."
        case .invalidEmail:
            return "Email không hợp lệ."
        case .passwordTooShort:
            return "Mật khẩu phải có ít nhất 6 ký tự."
        case .passwordMismatch:
            return "Mật khẩu không khớp."
        }
    }
}

// MARK: - Register Logic
struct RegisterModel {
    static func validate(request: RegisterRequest) -> Result<Void, RegisterError> {
        // Kiểm tra rỗng
        guard !request.fullName.isEmpty,
              !request.email.isEmpty,
              !request.password.isEmpty,
              !request.confirmPassword.isEmpty else {
            return .failure(.emptyFields)
        }

        // Kiểm tra email đơn giản
        guard request.email.contains("@"), request.email.contains(".") else {
            return .failure(.invalidEmail)
        }

        // Mật khẩu tối thiểu 6 ký tự
        guard request.password.count >= 6 else {
            return .failure(.passwordTooShort)
        }

        // Kiểm tra mật khẩu khớp
        guard request.password == request.confirmPassword else {
            return .failure(.passwordMismatch)
        }

        return .success(())
    }

    static func register(request: RegisterRequest, completion: @escaping (Result<Void, RegisterError>) -> Void) {
        // Thực hiện đăng ký giả lập (mock)
        let validation = validate(request: request)

        switch validation {
        case .success:
            // Tạm thời chỉ in log hoặc lưu giả lập
            print("✅ Đăng ký thành công: \(request.email)")
            completion(.success(()))
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
