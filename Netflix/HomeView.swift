//
//  HomeView.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI

struct HomeView: View {
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
              ForEach(1..<10){item in
                Rectangle()
                  .frame(width: 106, height: 188)
                  .foregroundColor(.red)
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
