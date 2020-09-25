//
//  AnimeUseCase.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/25/20.
//

import Foundation
import Combine

final class AnimeUseCase {
        
    private var mainPath: String {
        "https://api.jikan.moe/v3/top/anime"
    }
        
    func loadTopAnimes() -> AnyPublisher<TopAnime, Error> {
        APIClient
            .path(mainPath)
            .fetch()
    }
}
