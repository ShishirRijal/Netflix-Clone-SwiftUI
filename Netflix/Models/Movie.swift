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
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let genreIDs: [Int]
    let adult: Bool
    let video: Bool
    let originalLanguage: String

  // We map JSON keys to Swift property names using CodingKeys
  enum CodingKeys: String, CodingKey {
      case id
      case title
      case originalTitle = "original_title"
      case overview
      case releaseDate = "release_date"
      case posterPath = "poster_path"
      case backdropPath = "backdrop_path"
      case voteAverage = "vote_average"
      case voteCount = "vote_count"
      case popularity
      case genreIDs = "genre_ids"
      case adult
      case video
      case originalLanguage = "original_language"
  }
  
  func getImageUrl() -> String {
    return "https://image.tmdb.org/t/p/w500/" + (self.backdropPath ?? "3EpZ2ksjijmdr8BhISP03PYzNFW.jpg")
  }

}




struct MovieResponse: Codable {
    let results: [Movie]
    let page: Int?
    let total_pages: Int?
    let total_results: Int?
}
