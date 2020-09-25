//
//  Anime.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/25/20.
//

import Foundation
import SwiftUI

struct TopAnime: Codable {
    let top: [Anime]
}

struct Anime: Codable, Hashable {
    let mal_id: Int
    let url: String?
    let image_url: String?
    let title: String
    let airing: Bool?
    let synopsis: String?
    let type: String?
    let episodes: Int?
    let score: Float?
    let start_date: String?
    let end_date: String?
    let members: Int?
    let rated: String?
}

// MARK: - Anime.Example

extension Anime {
   
    static var example: Anime {
        .init(
            mal_id: 21,
            url: "https://myanimelist.net/anime/21/One_Piece",
            image_url: "https://cdn.myanimelist.net/images/anime/6/73245.jpg?s=f792b8c9e28534ae455d06b15e686a14",
            title: "One Piece",
            airing: true,
            synopsis: "Gol D. Roger was known as the \"Pirate King,\" the strongest and most infamous being to have sailed the Grand Line. The capture and execution of Roger by the World Government brought a change throughout...",
            type: "TV",
            episodes: 0,
            score: 8.43,
            start_date: "1999-10-20T00:00:00+00:00",
            end_date: nil,
            members: 1115140,
            rated: "PG-13"
        )
    }
}
