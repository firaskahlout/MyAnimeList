//
//  AnimeItem.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/26/20.
//

import Foundation
import SwiftUI

struct AnimeItem: Hashable {
    let model: Anime
    let title: String
    let url: String
    let imageUrl: String
    let startDate: String
    let endDate: String
    
    init(model: Anime) {
        self.model = model
        self.title = model.title
        self.url = model.url
        self.imageUrl = model.image_url
        self.startDate = model.start_date.defaultIfEmpty
        self.endDate = model.end_date.defaultIfEmpty
    }
    
    var episodes: String {
        "Episodes: \(model.episodes)"
    }
    
    var rate: String {
        "Rate: \(model.score)/10"
    }
    
    var type: String {
        model.type.rawValue
    }
    
    var typeColor: Color {
        switch model.type {
        case .tv:
            return .red
        case .ova:
            return .yellow
        case .movie:
            return .blue
        }
    }
    
    var status: String {
        model.airing == true ? "Airing" : "End"
    }
    
    var statusColor: Color {
        model.airing == true ? .green : .red
    }
}
