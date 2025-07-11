//
//  SelectedGenreView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

import SwiftUI

struct SelectedGenreView: View {
    let genre: Genre

    var body: some View {
        Text("Genre: \(genre.name)")
            .padding(.horizontal)
            .foregroundColor(.blue)
    }
}


#Preview {
    let sampleGenre = Genre(id: 28, name: "Action")
    SelectedGenreView(genre: sampleGenre)
}

