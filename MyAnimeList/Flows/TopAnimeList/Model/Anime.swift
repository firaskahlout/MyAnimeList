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
    let images: AnimeImages
    let title: String
    let airing: Bool?
    let aired: Aired
    let type: AnimeType
    let score: Double
    let members: Int?
    let episodes: Int
    let rated: String?
    let trailer: Trailer
    
    // MARK: Details
    
    let trailer_url: String?
    let rating: String?
    let duration: String?
    let synopsis: String?
    
    enum AnimeType: String, Codable {
        case tv = "TV"
        case ova = "OVA"
        case ona = "ONA"
        case movie = "Movie"
    }
}

extension Anime {
    struct Aired: Codable, Hashable {
        let from: String
        let to: String?
        let prop: Prop
        let string: String
    }
    
    struct Prop: Codable, Hashable {
        let from: DateModel
        let to: DateModel
    }
    
    struct DateModel: Codable, Hashable {
        let day: Int?
        let month: Int?
        let year: Int?
    }
}

extension Anime {
    struct AnimeImages: Codable, Hashable {
        let jpg: Image
        let webp: Image
        
        struct Image: Codable, Hashable {
            let image_url: String?
            let small_image_url: String?
            let medium_image_url: String? = nil
            let large_image_url: String?
            let maximum_image_url: String? = nil
        }
    }
}

extension Anime {
    struct Trailer: Codable, Hashable {
        let youtube_id: String?
        let url: String?
        let embed_url: String?
        let images: AnimeImages.Image?
    }
}

// MARK: - Anime.Example

extension Anime {
   
    static var example: Anime {
        .init(
            mal_id: 21,
            url: "https://myanimelist.net/anime/21/One_Piece",
            images: .init(
                jpg: .init(
                    image_url: "https://cdn.myanimelist.net/images/anime/1223/96541.jpg",
                    small_image_url: "https://cdn.myanimelist.net/images/anime/1223/96541t.jpg",
                    large_image_url: "https://cdn.myanimelist.net/images/anime/1223/96541l.jpg"
                ),
                webp: .init(
                    image_url: "https://cdn.myanimelist.net/images/anime/1223/96541.webp",
                    small_image_url: "https://cdn.myanimelist.net/images/anime/1223/96541t.webp",
                    large_image_url: "https://cdn.myanimelist.net/images/anime/1223/96541l.webp"
                )
            ),
            title: "One Piece",
            airing: true,
            aired: .init(
                from: "2009-04-05T00:00:00+00:00",
                to: "2010-07-04T00:00:00+00:00",
                prop: .init(
                    from: .init(day: 5, month: 4, year: 2009),
                    to: .init(day: 4, month: 7, year: 2010)
                ),
                string: "Apr 5, 2009 to Jul 4, 2010"
            ),
            type: .tv,
            score: 8.43,
            members: 1115140,
            episodes: .zero,
            rated: "PG-13",
            trailer: .init(
                youtube_id: "--IcmZkvL0Q",
                url: "https://www.youtube.com/watch?v=--IcmZkvL0Q",
                embed_url: "https://www.youtube.com/watch?v=--IcmZkvL0Q?enablejsapi=1&wmode=opaque&autoplay=1",
                images: .init(
                    image_url: "https://img.youtube.com/vi/--IcmZkvL0Q/default.jpg",
                    small_image_url: "https://img.youtube.com/vi/--IcmZkvL0Q/sddefault.jpg",
                    large_image_url: "https://img.youtube.com/vi/--IcmZkvL0Q/hqdefault.jpg"
                )
            ),
            trailer_url: "https://www.youtube.com/embed/27OZc-ku6is?enablejsapi=1&;amp;wmode=opaque&amp;autoplay=1",
            rating: "PG-13 - Teens 13 or older",
            duration: "24 min per ep",
            synopsis: "The self-proclaimed mad scientist Rintarou Okabe rents out a room in a rickety old building in Akihabara, where he indulges himself in his hobby of inventing prospective \"future gadgets\" with fellow lab members: Mayuri Shiina, his air-headed childhood friend, and Hashida Itaru, a perverted hacker nicknamed \"Daru.\" The three pass the time by tinkering with their most promising contraption yet, a machine dubbed the \"Phone Microwave,\" which performs the strange function of morphing bananas into piles of green gel. Though miraculous in itself, the phenomenon doesn't provide anything concrete in Okabe's search for a scientific breakthrough; that is, until the lab members are spurred into action by a string of mysterious happenings before stumbling upon an unexpected success—the Phone Microwave can send emails to the past, altering the flow of history. Adapted from the critically acclaimed visual novel by 5pb. and Nitroplus, Steins;Gate takes Okabe through the depths of scientific theory and practicality. Forced across the diverging threads of past and present, Okabe must shoulder the burdens that come with holding the key to the realm of time. [Written by MAL Rewrite]"
        )
    }
}
