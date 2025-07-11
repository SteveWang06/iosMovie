//
//  TokenManager.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/11.
//

import Foundation
import KeychainAccess

struct TokenManager {
    private static let keychain = Keychain(service: "com.iosmovie.token")
    private static let tokenKey = "accessToken"

    static func saveToken(_ token: String) {
        do {
            try keychain.set(token, key: tokenKey)
        } catch {
            print("Failed to save token: \(error)")
        }
    }

    static func getToken() -> String? {
        return keychain[tokenKey]
    }

    static func deleteToken() {
        do {
            try keychain.remove(tokenKey)
        } catch {
            print("Failed to delete token: \(error)")
        }
    }
}
