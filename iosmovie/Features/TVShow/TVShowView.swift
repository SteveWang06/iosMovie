//
//  TVShowView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/8.
//


import SwiftUI

struct TVShowView: View {
    @State private var selectedGenre: Genre?
    @StateObject private var genreViewModel = TvShowGenreViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("TV Shows")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Spacer()

                    TvShowGenreMenuView(
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
                    TvShowListView(genre: genre)
                } else {
                    Text("Select a genre")
                        .foregroundColor(.gray)
                        .padding()
                }

                Spacer()
            }
            .task {
                await genreViewModel.fetchGenres()
                if selectedGenre == nil, let first = genreViewModel.genres.first {
                    selectedGenre = first
                }
            }
        }
    }
}



#Preview {
    TVShowView()
}
