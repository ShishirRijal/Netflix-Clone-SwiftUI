//
//  TvShowDetail.swift
//  Netflix
//
//  Created by Shishir Rijal on 04/11/2024.
//

import Foundation


// MARK: - TV Show Detail Model
//
//struct TVShowDetail: Codable {
//    let id: Int
//    let name: String
//    let adult: Bool
//    let overview: String
//    let posterPath: String?
//    let backdropPath: String?
//    let genres: [Genre]
//    let episodeRunTime: [Int]
//    let numberOfSeasons: Int
//    let numberOfEpisodes: Int
//    let seasons: [Season]
//    let voteAverage: Double
//    let firstAirDate: String
//    let productionCompanies: [ProductionCompany]
//    let createdBy: [Creator]
//
//
//  
//    enum CodingKeys: String, CodingKey {
//        case id, name, overview, genres, seasons, adult
//        case posterPath = "poster_path"
//        case backdropPath = "backdrop_path"
//        case episodeRunTime = "episode_run_time"
//        case numberOfSeasons = "number_of_seasons"
//        case numberOfEpisodes = "number_of_episodes"
//        case voteAverage = "vote_average"
//        case firstAirDate = "first_air_date"
//        case productionCompanies = "production_companies"
//        case createdBy = "created_by"
//    }
//}


struct ProductionCompany: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}



struct Creator: Codable {
    let id: Int
    let name: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePath = "profile_path"
    }
}




struct Season: Codable {
    let airDate: String
    let episodes: [Episode]?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodes
    }
}

struct Episode: Codable {
    let id: Int
    let name: String
    let overview: String
    let episodeNumber: Int
    let seasonNumber: Int
    let stillPath: String?
    let runtime: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, overview, runtime
        case episodeNumber = "episode_number"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
    }
}
