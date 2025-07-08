//
//  MainTabView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/8.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MovieView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Movie")
                }

            TVShowView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("TV Show")
                }

            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
        }
    }
}


#Preview {
    MainTabView()
}
