//
//  SwiftUIView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = LoginViewModel()
    @State private var showRegister = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Email: test@example.com")
                    .font(.system(size: 12, weight: .light, design: .serif))
                Text("Password: 123456")
                    .font(.system(size: 12, weight: .light, design: .serif))
            }
           

            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // MARK: - Login Button
            Button("Login") {
                viewModel.login(appState: appState)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
            
            SocialLoginButtons()
            
            // MARK: - Register Button
            Button("Register") {
                showRegister = true
            }
            .fullScreenCover(isPresented: $showRegister) {
                RegisterView()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .foregroundColor(.blue)
            
            // MARK: - Error
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.top, 8)
            }
        }
        .padding()
    }
}



#Preview {
    LoginView()
}
