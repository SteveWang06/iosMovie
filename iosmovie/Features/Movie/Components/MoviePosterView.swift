//
//  MoviePosterView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/19.
//

import SwiftUI

struct MoviePosterView: View {
    let imageURL: URL?

    @ViewBuilder
    private func imageContent(phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            Color.gray.opacity(0.3)
        case .success(let image):
            image
                .resizable()
                .scaledToFill()
                .clipped()
        case .failure:
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
        @unknown default:
            EmptyView()
        }
    }

    var body: some View {
        AsyncImage(url: imageURL, content: imageContent)
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
    }
}



#Preview {
    MoviePosterView(imageURL: nil)
}
