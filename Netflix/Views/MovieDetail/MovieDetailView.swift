//
//  MovieDetailView.swift
//  Netflix
//
//  Created by Shishir Rijal on 27/10/2024.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {







      // MARK: Action Buttons
      // My List
      HStack(spacing: 60) {
        VerticalIconButton(text: "My List", image: "plus") {
              //
          }
        // Rate
        VerticalIconButton(text: "Rate", image: "hand.thumbsup") {
              //
          }
        // Share
        VerticalIconButton(text: "Share", image: "square.and.arrow.up") {
              //
          }

          Spacer()
      }
      .padding(.leading, 20)
    }

}

#Preview {
    MovieDetailView()
    .preferredColorScheme(.dark)
}




