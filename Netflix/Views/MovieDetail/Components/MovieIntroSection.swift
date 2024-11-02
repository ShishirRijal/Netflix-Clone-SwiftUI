//
//  MovieIntroSection.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct MovieIntroSection: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image("LetterLogo")
                    .resizable()
                    .frame(width: 8, height: 15)
                Text("SERIES")
                    .tracking(4)
                    .font(.bodyFont)
            }
            Text(movie.title)
                .font(.customFont(.medium, 20))

            HStack {
              Text(String(movie.releaseDate))
              Text("TV-MA")
                    .padding(5)
                    .background(Color.grayLight1)

              // If TV-Show
              if(!movie.isMovie) {
                Text("\(movie.numberOfSeasons!) Seasons") // replace with no. of seasons
              }

            }
            .font(.bodyFont)
            .foregroundColor(.primaryFontColor)
        }
    }
}
#Preview {
    MovieIntroSection(movie: dummyMovie)
}
