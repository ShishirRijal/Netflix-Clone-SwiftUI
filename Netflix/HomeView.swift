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
      ScrollView {

        ZStack(alignment: .top) {
          GeometryReader { geometry in
            Image("CaptainMarvel")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: geometry.size.width, height: geometry.size.height*1.2 )
              .overlay(
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.1), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
              )

          }

          VStack {
            HomeViewHeader()

            Spacer()

            // Buttons


            HomeViewButtons()
          }
          .padding(.top, 30)
          .frame(width: .infinity, height: UIScreen.main.bounds.height*0.6)


        }
        Spacer()
          .frame(height: 50)

        VStack (alignment: .leading) {
          Text("Continue Watching")
            .font(.title3)
            .fontWeight(.medium)
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
      .background(Color.black)
      .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}



struct HomeViewButtons: View {
  var body: some View {
    HStack {
      
      
      Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        VStack{
          Image(systemName: "plus").foregroundColor(.white)
          Spacer().frame(height: 2)
          Text("My List")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.white)
        }
        
      })
      Spacer()
      
      Button(action: {}, label: {
        HStack {
          Image(systemName: "play.fill")
            .foregroundColor(.black)
          Text("Play")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.black)
          
        }
      })
      .padding(.vertical, 8)
      .padding(.horizontal, 20)
      .background(.white)
      .cornerRadius(4)
      
      Spacer()
      
      Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        VStack{
          Image(systemName: "info.circle").foregroundColor(.white)
          Spacer().frame(height: 2)
          Text("Info")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.white)
        }
        
      })
      
    }
    .frame(width: UIScreen.main.bounds.width*0.7)
  }
}

struct HomeViewHeader: View {
  var body: some View {
    HStack {
      Image("LetterLogo")
        .frame(width: 18, height: 32)
      
      Spacer()
      
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
    .padding(.all, 20)
  }
}
