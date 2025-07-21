//
//  MovieDetailView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/19.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    @StateObject private var viewModel = MovieDetailViewModel()

    var body: some View {
        VStack {
            if let movie = viewModel.movie {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        MoviePosterView(imageURL: movie.posterURL)

                        Text(movie.title)
                            .font(.title)
                            .bold()

                        Text("⭐️ \(movie.rating, specifier: "%.1f")")
                            .font(.subheadline)
                            .foregroundColor(.orange)

                        Text(movie.overview)
                            .font(.body)
                            .padding(.top, 8)
                    }
                    .padding()
                }
            } else if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            } else {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchMovieDetail(id: movieId)
        }
    }
}



#Preview {
    MovieDetailView(movieId: 603)
}
