//
//  GenreMenuView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

import SwiftUI

struct GenreMenuView: View {
    @Binding var selectedGenre: Genre?
    @ObservedObject var genreViewModel: MovieGenreViewModel
    let onSelect: (Genre) -> Void

    var body: some View {
        Menu {
            if genreViewModel.genres.isEmpty {
                Text("Loading...").foregroundColor(.gray)
            } else {
                ForEach(genreViewModel.genres) { genre in
                    Button(genre.name) {
                        selectedGenre = genre
                        onSelect(genre)
                    }
                }
            }
        } label: {
            Image(systemName: "ellipsis")
                .imageScale(.large)
                .padding(.horizontal)
        }
    }
}



struct GenreMenuView_Previews: PreviewProvider {
    @State static var selectedGenre: Genre? = Genre(id: 28, name: "Action")
    static var genreViewModel = MovieGenreViewModel()

    static var previews: some View {
        GenreMenuView(
            selectedGenre: $selectedGenre,
            genreViewModel: genreViewModel
        ) { genre in
            print("Selected genre: \(genre.name)")
        }
    }
}
