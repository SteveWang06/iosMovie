//
//  MovieDetailViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/19.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var error: String?

    func fetchMovieDetail(id: Int) async {
        let urlString = "\(APIConstants.movieDetail)\(id)"
        guard let url = URL(string: urlString) else {
            error = "Invalid URL"
            return
        }

        do {
            movie = try await APIService.shared.fetch(url: url, type: Movie.self)
        } catch {
            self.error = error.localizedDescription
        }
    }
}

