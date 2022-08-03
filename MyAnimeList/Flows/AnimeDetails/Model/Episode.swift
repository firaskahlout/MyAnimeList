//
//  Episode.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/28/20.
//

import Foundation

struct Episode: Codable, Hashable {
    let mal_id: Int
    let title: String
    let title_japanese: String
    let title_romanji: String
    let aired: String
    let score: Double
    let filler: Bool
    let recap: Bool
    let url: String
    let forum_url: String
}

// MARK: - Episode.example

extension Episode {
    static var example: Episode {
        .init(
            mal_id: 1,
            title: "Enter: Naruto Uzumaki!",
            title_japanese: "参上! うずまきナルト",
            title_romanji: "Sanjou! Uzumaki Naruto ",
            aired: "2002-10-03T00:00:00+00:00",
            score: 4.4,
            filler: false,
            recap: false,
            url: "https://myanimelist.net/anime/20/Naruto/episode/1",
            forum_url: "https://myanimelist.net/forum/?topicid=99623"
        )
    }
}
