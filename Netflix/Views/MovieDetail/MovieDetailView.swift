//
//  MovieDetailView.swift
//  Netflix
//
//  Created by Shishir Rijal on 27/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel

    init(movie: Movie) {
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(movie: movie))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
              MovieDetailHeroView(url: viewModel.movie.getImageUrl())
                MovieIntroSection(movie: viewModel.movie)
                    .padding(.horizontal, 10)
                ActionButtonsSection()
                MovieDescriptionSection(
                    description: viewModel.movie.overview,
                    cast: viewModel.movie.cast,
                    creator: viewModel.movie.creators
                )
                .padding(.horizontal, 10)


                // Only For TVShows
              if(!viewModel.movie.isMovie) {
                SeasonSelectionButton(
                    selectedSeason: $viewModel.selectedSeason,
                    showSeasonPicker: $viewModel.showSeasonPicker
                )
                .padding(.horizontal, 10)

              EpisodeList(season: viewModel.movie.seasons![viewModel.selectedSeason])
              }

            }
        }
        .overlay(
            SeasonPickerOverlay(
                showSeasonPicker: $viewModel.showSeasonPicker,
                selectedSeason: $viewModel.selectedSeason,
                seasonCount: viewModel.movie.numberOfSeasons ?? 0
            )
        )
        .onChange(of: viewModel.selectedSeason) { newSeason in
            viewModel.loadEpisodes(for: newSeason)
        }
    }
}


// MARK: - Episode List for a Season
struct EpisodeList: View {
    let season: Season

    var body: some View {
        VStack(alignment: .leading) {
          ForEach(season.episodes, id: \.id) { episode in
            CustomEpisodeView(episode: episode)
              .padding(.bottom, 20)
            }
        }
    }
}



#Preview {
    MovieDetailView(movie: dummyMovie)
        .preferredColorScheme(.dark)
}
