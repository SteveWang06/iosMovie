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

    
}

extension Movie {
    var posterURL: URL? {
        NetworkHelper.getImageURL(path: posterPath)
    }
}
