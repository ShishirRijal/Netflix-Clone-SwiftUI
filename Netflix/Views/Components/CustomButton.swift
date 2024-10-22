//
//  CustomButton.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let image: String?
    let action: () -> Void

    // Colors for light and dark mode
    var lightModeColor: Color = .black
    var darkModeColor: Color = .white

    var body: some View {
        Button(action: action) {
            HStack {
                if let imageName = image {
                    Image(systemName: imageName)
                }
                Text(title)
                    .font(.bodyFont)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            .background(.white)
            .foregroundColor(.customBlack)
            .cornerRadius(4)
        }
    }

}

#Preview {
  CustomButton(title: "Download", image: "download") {}
}
