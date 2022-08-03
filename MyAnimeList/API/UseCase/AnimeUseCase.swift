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
        static let topAnime = "https://api.jikan.moe/v4/top/anime"
        static let anime = "https://api.jikan.moe/v4/anime"
    }
        
    func loadTopAnimes() -> AnyPublisher<PagingResponse<Anime>, Error> {
        APIClient
            .path(Path.topAnime)
            .fetch()
    }
    
    func loadAnime(by id: Int) -> AnyPublisher<Response<Anime>, Error> {
        APIClient
            .path(Path.anime + "/\(id)")
            .fetch()
    }
    
    func loadEpisodes(for animeId: Int) -> AnyPublisher<PagingResponse<Episode>, Error> {
        APIClient
            .path(Path.anime + "/\(animeId)/episodes")
            .fetch()
    }
}
