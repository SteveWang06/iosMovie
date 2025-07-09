//
//  Genre.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

// Shared/Models/Genre.swift

import Foundation

struct GenreResponse: Decodable {
    let genres: [Genre]
}

struct Genre: Identifiable, Decodable {
    let id: Int
    let name: String
}
