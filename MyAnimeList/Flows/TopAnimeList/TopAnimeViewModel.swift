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
    
    @Published var state: ListState<AnimeItem> = .populated([.init(model: .example)])
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: LifeCycle
    
    func onAppear() {
        state = .loading
        AnimeUseCase().loadTopAnimes()
            .sink { [weak self] result in
                switch result {
                case let .success(value):
                    let items = value.data.map { AnimeItem(model: $0) }
                    self?.state = .populated(items)
                case let .failure(error):
                    print(error)
                    self?.state = .error(error.localizedDescription)
                }
            }.store(in: &cancellables)
    }
}
