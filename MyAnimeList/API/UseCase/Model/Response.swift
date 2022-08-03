//
//  Response.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 03/08/2022.
//

import Foundation

struct Response<Model: Codable>: Codable {
    let data: Model
    
    init(data: Model) {
        self.data = data
    }
}
