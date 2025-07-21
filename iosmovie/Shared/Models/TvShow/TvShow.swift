//
//  TvShow.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/21.
//

import Foundation


struct TvShowResponse: Codable {
    let results: [TvShow]
}

struct TvShow: Identifiable, Codable {
    let id: Int
    let name: String
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
    }
}


extension TvShow {
    var posterURL: URL? {
        NetworkHelper.getImageURL(path: posterPath)
    }
}
