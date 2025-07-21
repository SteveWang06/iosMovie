//
//  TvShowGenreView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/21.
//

import SwiftUI

struct TvShowGenreView: View {
    @StateObject private var viewModel = TvShowGenreViewModel()

    var body: some View {
        List(viewModel.genres) { genre in
            Text(genre.name)
        }
        .task {
            await viewModel.fetchGenres()
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
    TvShowGenreView()
}
