//
//  MovieListView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

import SwiftUI

struct MovieListView: View {
    let genre: Genre
    @StateObject private var movieListViewModel = MovieListViewModel()

    var body: some View {
        Group {
            if movieListViewModel.movies.isEmpty {
                ProgressView("Loading movies...")
                    .frame(maxWidth: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(movieListViewModel.movies) { movie in
                            MovieCardView(movie: movie)
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .task(id: genre.id) {
            
            await movieListViewModel.loadMovies(forGenreId: genre.id)
        }
    }
}


#Preview {
    MovieListView(genre: Genre(id: 28, name: "Action"))
}

