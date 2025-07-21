//
//  MovieView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/8.
//

import SwiftUI

struct MovieView: View {
    @State private var selectedGenre: Genre?
    @StateObject private var genreViewModel = MovieGenreViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Movies")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    GenreMenuView(
                        selectedGenre: $selectedGenre,
                        genreViewModel: genreViewModel
                    ) { genre in
                        selectedGenre = genre
                    }
                }
                .padding([.horizontal, .top])
                
                if let genre = selectedGenre {
                    Text("Genre: \(genre.name)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                }
                
                if let genre = selectedGenre {
                    MovieListView(genre: genre)
                } else {
                    Text("Loading...")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .task {
                await genreViewModel.loadGenres()
                if selectedGenre == nil, let first = genreViewModel.genres.first {
                    selectedGenre = first
                }
            }
        }
    }
}


#Preview {
    MovieView()
}

