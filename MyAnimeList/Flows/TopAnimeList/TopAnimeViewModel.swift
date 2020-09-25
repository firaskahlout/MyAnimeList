//
//  TopAnimeViewModel.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/25/20.
//

import Foundation
import Combine

final class TopAnimeViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var animes: [Anime] = [.example, .example]
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: LifeCycle
    
    func onAppear() {
        AnimeUseCase().loadTopAnimes()
            .sink { [weak self] result in
                switch result {
                case let .success(value):
                    self?.animes = value.top
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }.store(in: &cancellables)
    }
}
