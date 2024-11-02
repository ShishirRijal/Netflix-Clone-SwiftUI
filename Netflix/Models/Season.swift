//
//  Season.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import Foundation

struct Season: Codable, Identifiable {
    let id: Int
    let seasonNumber: Int
    let episodes: [Episode]

    // MARK: Computed Property for Season Title
    var title: String {
        return "Season \(seasonNumber)"
    }
}


let dummySeasons: [Season] = [
    Season(
        id: 1,
        seasonNumber: 1,
        episodes: dummyEpisodes
    ),
    Season(
        id: 2,
        seasonNumber: 2,
        episodes: dummyEpisodes
    )
]
