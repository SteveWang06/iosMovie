//
//  MovieCardView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: movie.posterURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 100, height: 150)
            .cornerRadius(12)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                Text("⭐️ \(movie.rating, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

#Preview {
    MovieCardView(movie: MockData.movies[0])
}
