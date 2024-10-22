//
//  HomeView.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct HomeView: View {

  let posterImageLinks = [
      "https://image.tmdb.org/t/p/w500/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg",
      "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
      "https://image.tmdb.org/t/p/w500/lqoMzCcZYEFK729d6qzt349fB4o.jpg",
      "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      "https://image.tmdb.org/t/p/w500/qpdFKDvJS7oLKTcBLXOaMwUESbs.jpg",
      "https://image.tmdb.org/t/p/w500/kKgQzkUCnQmeTPkyIwHly2t6ZFI.jpg",
      "https://image.tmdb.org/t/p/w500/izuzUb0sDokqp9o8utVfsrSJuy5.jpg",
      "https://image.tmdb.org/t/p/w500/wWba3TaojhK7NdycRhoQpsG0FaH.jpg",
      "https://image.tmdb.org/t/p/w500/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
      "https://image.tmdb.org/t/p/w500/l1175hgL5DoXnqeZQCcU3eZIdhX.jpg",
      "https://image.tmdb.org/t/p/w500/iz2GabtToVB05gLTVSH7ZvFtsMM.jpg",
      "https://image.tmdb.org/t/p/w500/3EpZ2ksjijmdr8BhISP03PYzNFW.jpg",
      "https://image.tmdb.org/t/p/w500/hPIWQT70wQK6akqfLXByEvr62u0.jpg"
  ]

    var body: some View {
      NavigationStack {
        ScrollView {

          ZStack(alignment: .top) {

            // Hero Image
            GeometryReader { geometry in
              Image("CaptainMarvel")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height*1.2 )
                .overlay(
                  LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.2), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                )

            }
            
            VStack {
              Spacer()
              
              // Movie Name and Tags
              Text("Captain Marvel")
                .font(.heroHeaderFont)
                .lineLimit(2)
                .padding(.bottom, 3)
              Text("Sci-Fi • Adventure • Fantasy")
                .font(.customFont(.light, 16))
                .padding(.bottom, 30)


              HomeViewButtons()
            }
            .padding(.top, 30)
            .frame(width: .infinity, height: UIScreen.main.bounds.height*0.6)


          }
          Spacer()
            .frame(height: 50)

          ContinueWatching(posterImageLinks: posterImageLinks)


        }
        .preferredColorScheme(.dark)
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Image("LetterLogo")
              .resizable()
              .frame(width: 20, height: 32)
          }

          ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 20) {
              Image(systemName: "airplayvideo")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)

              Image("ProfileIcon")
                .resizable()
                .frame(width: 24, height: 24)
            }
          }
        }
        
      .ignoresSafeArea()
      }
    }
}

#Preview {
    HomeView()
}


struct HomeViewButtons: View {

    // Reusable button view for My List and Info buttons
    private func iconButton(image: String, text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack {
                Image(systemName: image)
                    .font(.title2)
                Spacer().frame(height: 2)
                Text(text)
                    .font(.bodyFont)
            }
            .foregroundColor(.white)
        }
    }

    var body: some View {
        HStack {
            iconButton(image: "plus", text: "My List", action: {
                // Action here
            })

            Spacer()

            // Play Button
          CustomButton(title: "Play", image: "play.fill") {
                          print("Play button tapped")
                      }

            Spacer()

            iconButton(image: "info.circle", text: "Info", action: {
                // Add your action here
            })
        }
        .frame(width: UIScreen.main.bounds.width * 0.7)
    }
}



struct ContinueWatching: View {
  let posterImageLinks: [String]

  var body: some View {
    VStack (alignment: .leading) {
      Text("Continue Watching")
        .font(.titleFont)
        .foregroundColor(.white)
      
      ScrollView(.horizontal) {
        HStack(spacing: 10) {

          ForEach(1..<posterImageLinks.count){index in
            WebImage(url: URL(string: posterImageLinks[index]))
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 106, height: 188)
              .clipped()
          }

        }
      }
    }
  }
}



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
            .cornerRadius(8)
        }
    }

}
