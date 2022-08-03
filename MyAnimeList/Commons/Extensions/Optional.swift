//
//  Optional.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/26/20.
//

import Foundation

extension Optional where Wrapped == String {
    var defaultIfEmpty: String {
        switch self {
        case let .some(value):
            return value.isEmpty ? "-" : value
        case .none:
            return "-"
        }
    }
}

extension Optional where Wrapped == Int {
    var defaultValue: Int {
        switch self {
        case let .some(value):
            return value
        case .none:
            return 0
        }
    }
}
