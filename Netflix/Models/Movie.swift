//
//  Movie.swift
//  Netflix
//
//  Created by Shishir Rijal on 23/10/2024.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
    let creators: String
    let cast: String
    let backdropPath: String?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let genreIDs: [Int]
    let adult: Bool
    let video: Bool
    let originalLanguage: String
    let numberOfSeasons: Int?
    let seasons: [Season]?
    let isMovie: Bool
    // MARK: Computed Property
    // Map genre IDs to genre names
      var genres: [String] {
          return genreIDs.compactMap { GenreMapper.genreName(for: $0) }
      }

    // URL generation for images
    func getImageUrl() -> String {
        return "https://image.tmdb.org/t/p/w500" + (backdropPath ?? "/3EpZ2ksjijmdr8BhISP03PYzNFW.jpg")
    }

}

enum MovieType {
    case movie
    case tvShow
}

// Response structure for decoding movie lists
struct MovieResponse: Codable {
    let results: [Movie]
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
}


// Example Usage
let dummyMovie = Movie(
  id: 1,
  title: "Avengers: Endgame",
  overview: "After the devastating events of Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore order to the universe.",
  releaseDate: "2019-04-26",
  posterPath: "/hPIWQT70wQK6akqfLXByEvr62u0.jpg",
  creators: "Anthony Russo, Joe Russo",
  cast: "Robert Downey Jr., Chris Evans, Scarlett Johansson, Mark Ruffalo",
  backdropPath: "/hPIWQT70wQK6akqfLXByEvr62u0.jpg",
  voteAverage: 8.4,
  voteCount: 1372,
  popularity: 500.0,
  genreIDs: [28, 12, 878], // Action, Adventure, Science Fiction
  adult: false,
  video: false,
  originalLanguage: "en",
  numberOfSeasons: 2,
  seasons: dummySeasons,
  isMovie: false
)
