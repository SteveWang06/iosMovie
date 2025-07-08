//
//  AccountView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/8.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationView {
            Button("Logout") {
                appState.logout()
            }
            .foregroundColor(.red)
            .navigationTitle("Account")
        }
    }
}


#Preview {
    AccountView()
}
