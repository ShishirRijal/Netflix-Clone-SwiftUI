import SwiftUI
import SDWebImageSwiftUI


struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
          ScrollView(showsIndicators: false) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    VStack {
                        if let featured = viewModel.featuredMovie {
                            HeroSection(movie: featured)
                        }

                        Spacer().frame(height: 50)

                        MoviesAndShowsView(viewModel: viewModel)
                            .padding(.all, 10)
                    }
                }
            }
            .refreshable {
                Task {
                    await viewModel.fetchAllContent()
                    await viewModel.fetchAllTVShows()
                }
            }

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
            .alert("Error", isPresented: $viewModel.showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "An unknown error occurred")
            }
        }
    }
}


#Preview {
  HomeView()
    .preferredColorScheme(.dark)
}


// MARK: HERO Section


struct HeroSection: View {
  let movie: NewMovie

    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
              VStack {
                WebImage(url: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()))
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: geometry.size.width, height: geometry.size.height * 1)
                      .overlay(
                          LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.2), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    )
                      .offset(y: -70)

              }
            }

            VStack {
                Spacer()

                // Movie Name and Tags
              Text(movie.title)
                    .font(.heroHeaderFont)
                    .foregroundColor(.customWhite)
                    .lineLimit(2)
                    .padding(.bottom, 3)

//                Text("Sci-Fi • Adventure • Fantasy")
//                    .font(.customFont(.light, 16))
//                    .padding(.bottom, 30)
                    .foregroundColor(.customWhite)

              Text("Trending Now")
                  .font(.customFont(.light, 16))
                  .padding(.bottom, 30)
                  .foregroundColor(.customWhite)

                HomeViewButtons()
            }
            .padding(.top, 30)
            .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.6)
        }
    }
}



// MARK: - Updated Movies And Shows View
struct MoviesAndShowsView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading) {
            if !viewModel.continueWatching.isEmpty {
                CategoryView(
                    title: "Continue Watching",
                    movies: viewModel.continueWatching,
                    isWatching: true
                )
            }

            CategoryView(
                title: "Netflix Originals",
                movies: viewModel.netflixOriginals
            )

            CategoryView(
                title: "Popular on Netflix",
                movies: viewModel.popularMovies
            )

            CategoryView(
                title: "Trending Now",
                movies: viewModel.trendingMovies
            )

            CategoryView(
                title: "Top Rated",
                movies: viewModel.topRatedMovies
            )

            // TV Shows
          Text("TV Shows")
            .font(.titleFont)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
              ForEach(viewModel.tvShows) { movie in
                MoviePreviewView(url: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()), isWatching: false)
              }
            }
          }
          .padding(.bottom, 20)


        }
    }
}

// MARK: - Updated Category View
struct CategoryView: View {
  let title: String
  let movies: [NewMovie]
  var isWatching: Bool = false

  var body: some View {

    VStack(alignment: .leading) {
      Text(title)
        .font(.titleFont)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 10) {
          ForEach((movies).shuffled()) { movie in
            MoviePreviewView(url: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()), isWatching: false)
          }
        }
      }
    }
    .padding(.bottom, 20)
  }

}



private func MoviePreviewView(url: URL, isWatching: Bool) -> some View {
  ZStack(alignment: .topLeading) {
    ZStack(alignment: .center) {
      WebImage(url: url)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 106, height: 152)
        .clipped()
        .overlay(.grayDark1.opacity(0.1))

      if isWatching {
        Image(systemName: "play.circle")
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.customWhite)
      }
    }
    .cornerRadius(8)

    Image("LetterLogo")
      .resizable()
      .frame(width: 18, height: 30)
      .padding(5)
  }
}



struct HomeViewButtons: View {
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
