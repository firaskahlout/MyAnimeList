//
//  ListState.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 10/13/20.
//

import Foundation

enum ListState<T> {
    
    case populated([T])
    case error(String)
    case loading
    
    var items: [T] {
        guard
            case let .populated(items) = self
        else { return [] }
        return items
    }
}
