//
//  SearchView.swift
//  Netflix
//
//  Created by Shishir Rijal on 23/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
  @State var searchText: String = ""

  var body: some View {

    VStack (alignment: .leading) {

      HStack (spacing: 20) {
        Image(systemName: "magnifyingglass")
        TextField("Search for a show, movie, genre, etc.", text: $searchText)
        Spacer()

        }
      .font(.customFont(.light, 18))
      .padding(.vertical, 20)
      .padding(.horizontal, 20)
        .background(Color.customGrayDark2)

      Text("Top Searches")
        .font(.heroHeaderFont)
        .padding()

      ScrollView {
        ForEach(0 ..< 12) { item in
            TopSearchView(imageUrl: "https://image.tmdb.org/t/p/w500/hPIWQT70wQK6akqfLXByEvr62u0.jpg", title: "Breaking Bad")
        }
      }



//       Push everything up
      Spacer()
    }
    .ignoresSafeArea(edges: .bottom)
    .padding(.top, 1)
    .preferredColorScheme(.dark)

    }
}

#Preview {
    SearchView()
}


struct TopSearchView: View {
    let imageUrl: String
    let title: String

    var body: some View {
        HStack(spacing: 20) {

          WebImage(url: URL(string: imageUrl))
                .resizable()
                .frame(width: 146, height: 76)
                .aspectRatio(contentMode: .fill)

            Text(title)
                .lineLimit(2)
                .font(.customFont(.light, 16))

            Spacer()

            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing)
        }
        .background(Color.customGrayDark2)
    }
}
