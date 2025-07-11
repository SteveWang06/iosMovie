//
//  MovieGenreViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//



import Foundation

@MainActor
class MovieGenreViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    @Published var errorMessage: String?

    func loadGenres() async {
        guard var components = URLComponents(string: APIConstants.genreMovieList) else {
            errorMessage = "Invalid URL"
            return
        }

        components.queryItems = [
            URLQueryItem(name: "language", value: "en-US")
        ]

        guard let url = components.url else {
            errorMessage = "Failed to build URL"
            return
        }

        let request = NetworkHelper.makeAuthorizedGETRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(MovieGenreListResponse.self, from: data)
            self.genres = decoded.genres
        } catch {
            errorMessage = "Error loading genres: \(error.localizedDescription)"
        }
    }
}
