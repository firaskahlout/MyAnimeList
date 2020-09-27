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
    let url: String
    let image_url: String
    let title: String
    let airing: Bool?
    let synopsis: String?
    let type: AnimeType
    let episodes: Int
    let score: Double
    let start_date: String
    let end_date: String
    let members: Int
    let rated: String?
    
    enum AnimeType: String, Codable {
        case tv = "TV"
        case ova = "OVA"
        case movie = "Movie"
    }
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
            type: .tv,
            episodes: 0,
            score: 8.43,
            start_date: "Sep 1999",
            end_date: "Sep 1999",
            members: 1115140,
            rated: "PG-13"
        )
    }
}
