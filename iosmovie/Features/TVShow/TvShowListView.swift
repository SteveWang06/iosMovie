//
//  TvShowListView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/21.
//


import SwiftUI

struct TvShowListView: View {
    @StateObject private var viewModel = TvShowListViewModel()
    var genre: Genre

    var body: some View {
        ScrollView {
            if viewModel.shows.isEmpty {
                Text("Loading TV shows...")
                    .padding()
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                    ForEach(viewModel.shows) { show in
                        VStack {
                            AsyncImage(url: show.posterURL) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(height: 180)
                            .cornerRadius(8)

                            Text(show.name)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding()
            }
        }
        .task(id: genre.id) {
            await viewModel.fetchShows(for: genre.id)
        }
    }
}

#Preview {
    TvShowListView(genre: Genre(id: 18, name: "Drama"))
}
