//
//  TvShowGenreViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/21.
//

import Foundation

@MainActor
class TvShowGenreViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchGenres() async {
        isLoading = true
        errorMessage = nil
        genres.removeAll()
        
        defer { isLoading = false }
        
        
        guard var urlComponents = URLComponents(string: APIConstants.genreTvShowList) else {
            errorMessage = "Invalid URL"
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "en-US")
        ]
        
        guard let url = urlComponents.url else {
            errorMessage = "Failed to build URL"
            return
        }
        
        do {
            let decoded: MovieGenreListResponse = try await APIService.shared.fetch(url: url, type: MovieGenreListResponse.self)
            self.genres = decoded.genres

            
        } catch {
            errorMessage = "Error loading genres: \(error.localizedDescription)"
        }
        
    }
}
