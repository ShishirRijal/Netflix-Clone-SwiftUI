//
//  NewAndHotViewModel.swift
//  Netflix
//
//  Created by Shishir Rijal on 24/10/2024.
//

import Foundation

class NewAndHotViewModel: ObservableObject {
    @Published var movies: [NewMovie] = []
    @Published var activeTag: String = "upcoming" // Track the active tag
    @Published var loading: Bool = false
    init() {
        fetchMovies()
    }

  // Function to fetch popular movies
  func fetchMovies() {
    loading = true
    guard let url = URL(string: Constant.upcomingUrl) else {
          print("Invalid URL")
          return
      }

    NetworkManager.shared.performRequest(url: url) { (result: Result<NewMovieResponse, Error>) in
          switch result {
          case .success(let movieResponse):
              DispatchQueue.main.async {
                  self.movies = movieResponse.results
                  self.loading = false
              }

          case .failure(let error):
              print("Error fetching movies: \(error)")
            self.movies = []
            self.loading = false
          }
      }
  }

}
