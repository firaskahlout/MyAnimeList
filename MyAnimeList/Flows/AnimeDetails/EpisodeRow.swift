//
//  EpisodeRow.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 10/5/20.
//

import SwiftUI

struct EpisodeRow: View {
    
    let episode: Episode
    var body: some View {
        HStack(spacing: 12) {
            Text(episode.mal_id.string)
                .font(.headline)
                .foregroundColor(.white)
                .frame(minWidth: 55, maxHeight: 24)
                .background(Color.gray)
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 6) {
                Text("Eng: " + episode.title)
                Text("Jap: " + episode.title_japanese)
            }
        }
    }
}

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRow(episode: .example)
    }
}
