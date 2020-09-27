//
//  Publisher.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/26/20.
//

import Foundation
import Combine

extension Publisher {
    
    func sink(handler: @escaping (Result<Self.Output, Self.Failure>) -> Void) -> AnyCancellable {
        sink { completion in
            guard
                case let .failure(error) = completion
            else { return }
            handler(.failure(error))
        } receiveValue: { output in
            handler(.success(output))
        }
    }
}
