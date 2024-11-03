//
//  TvShow.swift
//  Netflix
//
//  Created by Shishir Rijal on 04/11/2024.
//

import SwiftUI


// MARK: - MovieResponse
struct NewMovieResponse: Codable {
    let page: Int
    let results: [NewMovie]
}

// MARK: - TVShowResponse
struct TVShowResponse: Codable {
    let page: Int
    let results: [TVShow]
}

// MARK: - Movie
struct NewMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String
    let voteAverage: Double
    let genreIDs: [Int]
    let adult: Bool
    let popularity: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, overview, adult, popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genreIDs = "genre_ids"
        case voteCount = "vote_count"
    }
}

// MARK: - TVShow
struct TVShow: Codable, Identifiable {
    let id: Int
    let name: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let firstAirDate: String
    let voteAverage: Double
    let genreIDs: [Int]
    let originCountry: [String]
    let adult: Bool
    let popularity: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, overview, adult, popularity, voteCount
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case genreIDs = "genre_ids"
        case originCountry = "origin_country"
    }
}
