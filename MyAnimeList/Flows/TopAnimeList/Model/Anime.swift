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
    let type: AnimeType
    let score: Double
    let members: Int?
    let episodes: Int
    let start_date: String?
    let end_date: String?
    let rated: String?
    
    // MARK: Details
    
    let trailer_url: String?
    let rating: String?
    let duration: String?
    let synopsis: String?
    
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
            type: .tv,
            score: 8.43,
            members: 1115140,
            episodes: .zero,
            start_date: "Sep 1999",
            end_date: "Sep 1999",
            rated: "PG-13",
            trailer_url: "https://www.youtube.com/embed/27OZc-ku6is?enablejsapi=1&;amp;wmode=opaque&amp;autoplay=1",
            rating: "PG-13 - Teens 13 or older",
            duration: "24 min per ep",
            synopsis: "The self-proclaimed mad scientist Rintarou Okabe rents out a room in a rickety old building in Akihabara, where he indulges himself in his hobby of inventing prospective \"future gadgets\" with fellow lab members: Mayuri Shiina, his air-headed childhood friend, and Hashida Itaru, a perverted hacker nicknamed \"Daru.\" The three pass the time by tinkering with their most promising contraption yet, a machine dubbed the \"Phone Microwave,\" which performs the strange function of morphing bananas into piles of green gel. Though miraculous in itself, the phenomenon doesn't provide anything concrete in Okabe's search for a scientific breakthrough; that is, until the lab members are spurred into action by a string of mysterious happenings before stumbling upon an unexpected success—the Phone Microwave can send emails to the past, altering the flow of history. Adapted from the critically acclaimed visual novel by 5pb. and Nitroplus, Steins;Gate takes Okabe through the depths of scientific theory and practicality. Forced across the diverging threads of past and present, Okabe must shoulder the burdens that come with holding the key to the realm of time. [Written by MAL Rewrite]"
        )
    }
}
