//
//  MovieDetailViewModel.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    @Published var selectedSeason: Int = 1
    @Published var showSeasonPicker: Bool = false
    @Published var episodes: [Episode] = []

    private var cancellables = Set<AnyCancellable>()

    init(movie: Movie) {
        self.movie = movie
        loadEpisodes(for: selectedSeason)
    }

  func loadEpisodes(for seasonIndex: Int) {
      // Find the season with the given season number and update the episodes.
      episodes = movie.seasons?.first(where: { $0.seasonNumber == seasonIndex })?.episodes ?? []
  }

}
