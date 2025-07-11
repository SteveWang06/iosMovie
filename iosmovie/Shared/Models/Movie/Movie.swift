//
//  Movie.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//


import Foundation

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case rating = "vote_average"
    }

    // Tạo computed property để lấy URL poster đầy đủ
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}

