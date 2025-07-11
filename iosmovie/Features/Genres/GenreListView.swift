//
//  GenreListView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

import SwiftUI

struct GenreListView: View {
    @StateObject private var viewModel = MovieGenreViewModel()

    var body: some View {
        List(viewModel.genres) { genre in
            Text(genre.name)
        }
        .task {
            await viewModel.loadGenres()
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}





#Preview {
    GenreListView()
}
