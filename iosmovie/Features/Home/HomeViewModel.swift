//
//  HomeViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    func fetchMovies() {
        // Trong thực tế gọi API ở đây, tạm thời mock data
        self.movies = MockData.movies
    }
}
