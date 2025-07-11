//
//  APIConstants.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

// APIConstants.swift

import Foundation

enum APIConstants {
    static let baseURL = "https://api.themoviedb.org/3"
    static let discoverMovie = "\(baseURL)/discover/movie"
    static let genreMovieList = "\(baseURL)/genre/movie/list"
    

    static let bearerToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNWRkNTRmNzdiN2E0NTI3NzU2MWY1ODM3ZTE5ZWIwNCIsIm5iZiI6MTcwNDYyNzg0MS43NTksInN1YiI6IjY1OWE4ZTgxMTU5NTlmMDI1YjZkZDMzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.95NqCrlHUK1dCDRASHckoyUgOS24CBQ2XIj_UQh3VR8"
}
