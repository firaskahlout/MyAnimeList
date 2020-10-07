//
//  AnimeUseCase.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/25/20.
//

import Foundation
import Combine

final class AnimeUseCase {
        
    private enum Path {
        static let topAnime = "https://api.jikan.moe/v3/top/anime"
        static let anime = "https://api.jikan.moe/v3/anime"
    }
        
    func loadTopAnimes() -> AnyPublisher<TopAnime, Error> {
        APIClient
            .path(Path.topAnime)
            .fetch()
    }
    
    func loadAnime(by id: Int) -> AnyPublisher<Anime, Error> {
        APIClient
            .path(Path.anime + "/\(id)")
            .fetch()
    }
    
    func loadEpisodes(for animeId: Int) -> AnyPublisher<EpisodeResult, Error> {
        APIClient
            .path(Path.anime + "/\(animeId)/episodes")
            .fetch()
    }
}
