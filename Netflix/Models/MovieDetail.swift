//
//  MovieDetail.swift
//  Netflix
//
//  Created by Shishir Rijal on 04/11/2024.
//

//import Foundation

//
//struct MovieDetail: Codable {
//    let adult: Bool
//    let genres: [Genre]
//    let id: Int
//    let originCountry: [String]?
//    let originalLanguage: String
//    let originalTitle: String
//    let overview: String?
//    let popularity: Double
//    let posterPath: String?
//    let productionCompanies: [ProductionCompany]
//    let releaseDate: String
//    let runtime: Int?
//    let status: String
//    let tagline: String?
//    let title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case genres
//        case id
//        case originCountry = "origin_country"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case popularity
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case releaseDate = "release_date"
//        case runtime
//        case status
//        case tagline
//        case title
//        case video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//
//}


//
//
//
//let dummyMovieDetail = MovieDetail(
//    adult: false,
//    genres: [
//        MovieDetail.Genre(id: 18, name: "Drama"),
//        MovieDetail.Genre(id: 80, name: "Crime"),
//        MovieDetail.Genre(id: 53, name: "Thriller")
//    ],
//    id: 12345,
//    originCountry: ["US"],
//    originalLanguage: "en",
//    originalTitle: "Joker: Folie à Deux",
//    overview: "Arthur Fleck struggles with his dual identity as he stumbles upon love and the music within.",
//    popularity: 2961.52,
//    posterPath: "/if8QiqCI7WAGImKcJCfzp6VTyKA.jpg",
//    productionCompanies: [
//        MovieDetail.ProductionCompany(id: 174, logoPath: "/zhD3hhtKB5qyv7ZeL4uLpNxgMVU.png", name: "Warner Bros. Pictures", originCountry: "US"),
//        MovieDetail.ProductionCompany(id: 83036, logoPath: nil, name: "Joint Effort", originCountry: "US"),
//        MovieDetail.ProductionCompany(id: 216687, logoPath: nil, name: "Domain Entertainment", originCountry: "US")
//    ],
//    releaseDate: "2024-10-01",
//    runtime: 138,
//    status: "Released",
//    tagline: "The world is a stage.",
//    title: "Joker: Folie à Deux",
//    video: false,
//    voteAverage: 5.68,
//    voteCount: 1278
//)
