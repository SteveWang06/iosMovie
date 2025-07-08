//
//  SplashView.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//

import SwiftUI

struct SplashView: View {
    @State private var animate = false

    var body: some View {
        VStack {
            Spacer()

            Image(systemName: "film")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .scaleEffect(animate ? 1.0 : 0.5)
                .opacity(animate ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0), value: animate)

            Text("IOS Movie")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 12)
                .opacity(animate ? 1.0 : 0.0)
                .offset(y: animate ? 0 : 20)
                .animation(.easeOut(duration: 1.2).delay(0.2), value: animate)

            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.9))
        .ignoresSafeArea()
        .onAppear {
            animate = true
        }
    }
}


#Preview {
    SplashView()
}
