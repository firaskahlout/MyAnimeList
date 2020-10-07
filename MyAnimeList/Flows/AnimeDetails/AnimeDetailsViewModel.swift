//
//  AnimeDetailsViewModel.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/28/20.
//

import Foundation
import Combine

typealias Handler = (() -> Void)

final class AnimeDetailsViewModel: ObservableObject {
    
    // MARK: Properties
    
    private let animeId: Int
    private let useCase = AnimeUseCase()
    @Published var anime: Anime = .example
    @Published var episodes: [Episode] = [.example]
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Init
    
    init(animeId: Int) {
        self.animeId = animeId
    }
    
    // MARK: LifeCycle
    
    func onAppear() {
        loadAnimeDetails()
        loadEpisodes()
    }
    
    // MARK: Actions
    
    func didTapDetailsButton() -> Handler {
        {}
    }
}

// MARK: - API

private extension AnimeDetailsViewModel {
    func loadAnimeDetails() {
        useCase.loadAnime(by: animeId)
            .sink { [weak self] result in
                switch result {
                case let .success(value):
                    self?.anime = value
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }.store(in: &cancellables)
    }
    
    func loadEpisodes() {
        useCase.loadEpisodes(for: animeId)
            .sink { [weak self] result in
                switch result {
                case let .success(value):
                    self?.episodes = value.episodes
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }.store(in: &cancellables)
    }
}
