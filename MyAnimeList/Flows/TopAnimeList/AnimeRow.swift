//
//  AnimeRow.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/26/20.
//

import SwiftUI

struct AnimeRow: View {
    let anime: AnimeItem
    
    var body: some View {
        HStack(alignment: .top) {
            
            // MARK: Anime Image
            WebImage(url: anime.imageUrl)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .frame(width: 110, height: 140)
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 10, y: 10)
            
            // MARK: Anime Details
            VStack(alignment: .leading, spacing: 20) {
                
                HStack(alignment: .top) {
                    
                    // MARK: Anime Type
                    Text(anime.type)
                        .font(.headline)
                        .foregroundColor(.white)
                    .frame(width: 65, height: 25)
                        .background(anime.typeColor)
                    .cornerRadius(4)
                    
                    // MARK: Status
                    HStack {
                        Circle()
                            .frame(width: 12, height: 12, alignment: .center)
                            .foregroundColor(anime.statusColor)
                        Text(anime.status)
                    }
                    
                    Spacer()
                    
                    // MARK: Start Date
                    Text(anime.startDate)
                }
                
                // MARK: Anime Name
                Text(anime.title)
                    .font(.headline)
                
                HStack {
                    // MARK: Anime Episodes Number
                    Text(anime.episodes)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    // MARK: Rate
                    Text(anime.rate)
                        .font(.subheadline)
                }
            }
        }
        
    }
}

struct AnimeRow_Previews: PreviewProvider {
    static var previews: some View {
        AnimeRow(anime: .init(model: .example))
    }
}
