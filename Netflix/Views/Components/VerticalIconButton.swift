//
//  VerticalIconButton.swift
//  Netflix
//
//  Created by Shishir Rijal on 27/10/2024.
//

import SwiftUI

struct VerticalIconButton: View {

    var text: String
    var image: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {

            VStack {
                Image(systemName: image)
                .padding(.bottom, 5)
                .font(.title)

                Text(text)
                .font(.bodyFont)
            }
            .foregroundColor(.primaryFontColor)
        }

    }
}

#Preview {
    VerticalIconButton(text: "Play", image: "play", action: {})
}
