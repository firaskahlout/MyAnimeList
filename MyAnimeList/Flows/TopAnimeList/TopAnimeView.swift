//
//  TopAnimeView.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/23/20.
//

import SwiftUI

struct TopAnimeView: View {
    
    // MARK: Properties
    
    @ObservedObject
    private var viewModel = TopAnimeViewModel()
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(self.viewModel.animes, id: \.self) { anime in
                        AnimeRow(anime: anime)
                            .padding(8)
                    }
                }
                .onAppear { viewModel.onAppear() }
            }
            .navigationTitle("Top Anime")
        }
    }
}

// MARK: - TopAnimeView_Previews

struct TopAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        TopAnimeView()
    }
}
