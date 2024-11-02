//
//  CustomEpisodeView.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct CustomEpisodeView: View {
    let episode: Episode

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
              WebImage(url: getImageUrl(path: episode.thumbnailUrl))
                    .resizable()
                    .aspectRatio(1.7, contentMode: .fit)
                    .frame(height: 70)
                    .overlay(
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.customWhite)
                    )

                VStack(alignment: .leading) {
                  Text(episode.name)
                        .font(.customFont(.regular, 16))
                  Text("      \(episode.length)")
                        .font(.customFont(.light, 14))
                }
            }
            Text(episode.description)
                .font(.customFont(.regular, 14))
        }
    }
}
