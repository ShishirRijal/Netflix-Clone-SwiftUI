//
//  Episode.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import Foundation

struct Episode: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var season: Int
    var episodeNumber: Int
    var thumbnailUrl: String
    var description: String
    var length: Int
    var videoURL: URL

}


let dummyEpisodes: [Episode] = [
    Episode(
        id: UUID().uuidString,
        name: "The Beginning",
        season: 1,
        episodeNumber: 1,
        thumbnailUrl: "/iz2GabtToVB05gLTVSH7ZvFtsMM.jpg",
        description: "The journey begins as our heroes unite to face an unimaginable threat.",
        length: 45,
        videoURL: URL(string: "https://example.com/video1.mp4")!
    ),
    Episode(
        id: UUID().uuidString,
        name: "The Rising Action",
        season: 1,
        episodeNumber: 2,
        thumbnailUrl:"/3EpZ2ksjijmdr8BhISP03PYzNFW.jpg",
        description: "Tensions rise as alliances are tested and the stakes become higher.",
        length: 50,
        videoURL: URL(string: "https://example.com/video2.mp4")!
    ),
    Episode(
        id: UUID().uuidString,
        name: "The Climax",
        season: 1,
        episodeNumber: 3,
        thumbnailUrl: "/hPIWQT70wQK6akqfLXByEvr62u0.jpg",
        description: "The ultimate showdown approaches as our heroes prepare for battle.",
        length: 48,
        videoURL: URL(string: "https://example.com/video3.mp4")!
    )
]

