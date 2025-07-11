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
                    
                    Menu {
                        if genreViewModel.genres.isEmpty {
                            Text("Loading...").foregroundColor(.gray)
                        } else {
                            ForEach(genreViewModel.genres) { genre in
                                Button(genre.name) {
                                    selectedGenre = genre
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .imageScale(.large)
                            .padding(.horizontal)
                            .foregroundColor(.black)
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
                    Text("Please select a genre")
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

