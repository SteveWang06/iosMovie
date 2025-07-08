//
//  ContentView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState()

    var body: some View {
        Group {
            switch appState.authStatus {
            case .loading:
                SplashView()
            case .loggedIn:
                MainTabView()
                    .environmentObject(appState)
            case .loggedOut:
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}


#Preview {
    ContentView()
}
