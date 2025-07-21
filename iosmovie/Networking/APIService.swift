//
//  APIService.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/19.
//

import Foundation

final class APIService {
    static let shared = APIService()

    private init() {}

    func fetch<T: Decodable>(url: URL, type: T.Type) async throws -> T {
        let request = NetworkHelper.makeAuthorizedGETRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
