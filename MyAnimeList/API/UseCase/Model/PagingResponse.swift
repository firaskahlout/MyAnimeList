//
//  PagingResponse.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 03/08/2022.
//

import Foundation

struct PagingResponse<Model: Codable>: Codable {
    let data: [Model]
    let pagination: Pagination
}

struct Pagination: Codable {
    let lastPage: Int
    let hasNextPage: Bool
    let currentPage: Int?
    let items: PageItems?
    
    enum CodingKeys: String, CodingKey {
        case lastPage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
        case items
    }
}

extension Pagination {
    struct PageItems: Codable {
        let count: Int
        let total: Int
        let perPage: Int
        
        enum CodingKeys: String, CodingKey {
            case count
            case total
            case perPage = "per_page"
        }
    }
}
