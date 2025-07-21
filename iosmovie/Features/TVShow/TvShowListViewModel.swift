//
//  TvShowListViewModel.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/21.
//

import Foundation

@MainActor
class TvShowListViewModel: ObservableObject {
    @Published var shows: [TvShow] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchShows(for genreId: Int) async {
        isLoading = true
        errorMessage = nil
        shows = []

        guard var urlComponents = URLComponents(string: APIConstants.discoverTvShows) else {
            errorMessage = "Invalid base URL"
            isLoading = false
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "with_genres", value: "\(genreId)"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "sort_by", value: "popularity.desc")
        ]
        
        

        guard let url = urlComponents.url else {
            errorMessage = "Invalid full URL"
            isLoading = false
            return
        }

        do {
            let response: TvShowListResponse = try await APIService.shared.fetch(url: url, type: TvShowListResponse.self)
            self.shows = response.results
        } catch {
            errorMessage = "Failed to fetch TV Shows: \(error.localizedDescription)"
        }

        isLoading = false
    }
}



