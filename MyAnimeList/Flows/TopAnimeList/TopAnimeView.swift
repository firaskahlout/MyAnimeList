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
            Group {
                if case let .error(error) = self.viewModel.state {
                    ReloadView(message: error, handler: { viewModel.onAppear() })
                } else if case .loading = self.viewModel.state {
                    ProgressView("Loading..")
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(self.viewModel.state.items, id: \.self) { anime in
                                NavigationLink(destination: AnimeDetailsView(anime: anime)) {
                                    AnimeRow(anime: anime)
                                        .padding(8)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Top Anime")
        }.onAppear { viewModel.onAppear() }
    }
}

// MARK: - TopAnimeView_Previews

struct TopAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        TopAnimeView()
    }
}
