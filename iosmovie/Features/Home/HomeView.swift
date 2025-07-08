//
//  HomeView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationView {
            VStack{
                Button("Logout") {
                    appState.logout()
                }
                .foregroundColor(.red)
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.movies) { movie in
                            MovieCardView(movie: movie)
                                .padding(.horizontal)
                        }
                    }
                }

            }
            
            .navigationTitle("Popular Movies")
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    HomeView()
}

