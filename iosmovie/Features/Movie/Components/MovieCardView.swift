//
//  MovieCardView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie

    var body: some View {
        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
            VStack(alignment: .leading, spacing: 10) {
                if let url = movie.posterURL {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    } placeholder: {
                        ZStack {
                            Color.gray.opacity(0.2)
                            ProgressView()
                        }
                        .frame(height: 200)
                        .cornerRadius(8)
                    }
                    .cornerRadius(12)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(movie.title)
                        .font(.headline)
                        .lineLimit(2)
                    
                    Text("⭐️ \(movie.rating, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                    
                    Text(movie.overview)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
            .padding(.horizontal)
            .padding(.vertical, 4)
        }
    }
}





#Preview {
    let sampleMovie = Movie(
        id: 1,
        title: "Sample Movie",
        overview: "This is a sample movie overview for testing purposes. It’s an action-packed, thrilling journey you don't want to miss.",
        posterPath: "/sample.jpg",
        rating: 8.5
    )
    MovieCardView(movie: sampleMovie)
}




