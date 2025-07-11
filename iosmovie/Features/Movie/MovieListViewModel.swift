//
//  MovieListViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var errorMessage: String?

    func loadMovies(forGenreId genreId: Int) async {
        guard var components = URLComponents(string: APIConstants.discoverMovie) else {
            errorMessage = "Invalid URL"
            return
        }

        components.queryItems = [
            URLQueryItem(name: "with_genres", value: "\(genreId)"),
            URLQueryItem(name: "language", value: "en-US")
        ]

        guard let url = components.url else {
            errorMessage = "Invalid URL components"
            return
        }

        let request = NetworkHelper.makeAuthorizedGETRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(MovieListResponse.self, from: data)
            self.movies = decoded.results
        } catch {
            errorMessage = "Error loading movies: \(error.localizedDescription)"
        }
    }
}
