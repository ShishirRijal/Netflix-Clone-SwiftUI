//
//  DownloadsView.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DownloadsView: View {
  
  @State var downloadedMovies: [Movie] = [dummyMovie, dummyMovie, dummyMovie]
  
    var body: some View {

      VStack (alignment: .leading) {


        Text("My Downloads")
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.bottom)
        // Smart Download
        HStack {
          Image(systemName: "info.circle")
            .font(.title2)
            .fontWeight(.bold)
          Text("Smart Downloads")
          Text("ON")
            .foregroundColor(.customRed)
          Spacer()

        }
        .font(.customFont(.bold, 18))
        .padding(.bottom)


        // Downloads
        if downloadedMovies.isEmpty {
          EmptyDownloadView()
        }
        else {
          ForEach(downloadedMovies) {movie in
            CustomDownloadCard(movie: movie)
              .padding(.bottom, 10)
          }
        }

        Spacer()


      }
      .padding(.horizontal)

    }
}


struct CustomDownloadCard: View {
  var movie: Movie

  var body: some View {
      VStack(alignment: .leading, spacing: 5) {
          HStack {
            WebImage(url: getImageUrl(path: movie.posterPath!))
                  .resizable()
                  .aspectRatio(1.7, contentMode: .fit)
                  .frame(height: 70)
                  .cornerRadius(8)


            VStack {
              HStack {
                VStack(alignment: .leading) {
                    Text(movie.title)
                          .font(.customFont(.medium, 16))
                          .lineLimit(2)

                  Text(movie.isMovie ? "243 MB" :  "\(movie.numberOfSeasons!) Seasons | 243 MB")
                          .font(.customFont(.light, 14))

                    Text("Downloaded")
                          .font(.customFont(.regular, 14))
                }
               // Only for TVShows
                if(!movie.isMovie) {
                  Spacer()
                  Image(systemName: "chevron.right")
                    .font(.title2)
                    .fontWeight(.medium)
                }
              }
            }
          }

      }
  }
}


#Preview {
    DownloadsView()
}

struct EmptyDownloadView: View {
  var body: some View {
    VStack (alignment: .center) {
      Spacer()
      Image(systemName: "arrow.down.to.line")
        .resizable()
        .fontWeight(.medium)
        .frame(width: 100, height: 100)
        .padding(50)
        .background(Color.customGray1)
        .foregroundColor(.white)
        .clipShape(Circle())
      
      Text("Never be without Netflix")
        .font(.customFont(.bold, 20))
        .multilineTextAlignment(.center)
        .padding(.bottom, 10)
      
      Text("Download shows and movies so you'll never be without something to watch\n-- even when you're offline")
        .font(.customFont(.regular, 16))
        .multilineTextAlignment(.center)
      
      Spacer().frame(height: 30)
      CustomButton(title: "See What You Can Download", image: nil) {
        // Go to home
      }
      
      Spacer()
      
    }
  }
}
