//
//  Episode.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/28/20.
//

import Foundation

struct EpisodeResult: Decodable {
    let episodes_last_page: Int
    let episodes: [Episode]
}

struct Episode: Decodable, Hashable {
    let episode_id: Int
    let title: String
    let title_japanese: String
    let title_romanji: String
    let aired: String
    let filler: Bool
    let recap: Bool
    let video_url: String
    let forum_url: String
}

// MARK: - Episode.example

extension Episode {
    static var example: Episode {
        .init(
            episode_id: 1,
            title: "Enter: Naruto Uzumaki!",
            title_japanese: "参上! うずまきナルト",
            title_romanji: "Sanjou! Uzumaki Naruto ",
            aired: "2002-10-03T00:00:00+00:00",
            filler: false,
            recap: false,
            video_url: "https://myanimelist.net/anime/20/Naruto/episode/1",
            forum_url: "https://myanimelist.net/forum/?topicid=99623"
        )
    }
}
