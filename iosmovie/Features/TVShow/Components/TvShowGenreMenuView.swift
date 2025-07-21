//
//  TvShowGenreMenuView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/21.
//

import SwiftUI

struct TvShowGenreMenuView: View {
    @Binding var selectedGenre: Genre?
    @ObservedObject var genreViewModel: TvShowGenreViewModel
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



struct TvShowGenreMenuView_Previews: PreviewProvider {
    @State static var selectedGenre: Genre? = Genre(id: 10759, name: "Action & Adventure")
    static var genreViewModel = TvShowGenreViewModel()

    static var previews: some View {
        TvShowGenreMenuView(
            selectedGenre: $selectedGenre,
            genreViewModel: genreViewModel
        ) { genre in
            print("Selected genre: \(genre.name)")
        }
    }
}

