//
//  SocialLoginButtons.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/8.
//

import SwiftUI

struct SocialLoginButtons: View {
    var body: some View {
        HStack(spacing: 24) {
            SocialIconButton(
                iconName: "facebook_icon",
                action: {
                    print("Facebook tapped")
                }
            )

            SocialIconButton(
                iconName: "Google_icon",
                action: {
                    print("Google tapped")
                }
            )

            SocialIconButton(
                iconName: "applelogo", // SF Symbol
                isSystemIcon: true,
                action: {
                    print("Apple tapped")
                }
            )
        }
        .padding(.vertical, 16)
    }
}

struct SocialIconButton: View {
    let iconName: String
    let isSystemIcon: Bool
    let action: () -> Void

    init(iconName: String, isSystemIcon: Bool = false, action: @escaping () -> Void) {
        self.iconName = iconName
        self.isSystemIcon = isSystemIcon
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            let image = isSystemIcon ? Image(systemName: iconName) : Image(iconName)

            image
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
                .foregroundColor(isSystemIcon ? .black : .primary)
        }

    }
}



#Preview {
    SocialLoginButtons()
}
