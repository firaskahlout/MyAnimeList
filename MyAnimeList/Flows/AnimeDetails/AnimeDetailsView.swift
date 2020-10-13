//
//  AnimeDetailsView.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/28/20.
//

import SwiftUI

struct AnimeDetailsView: View {
    
    @ObservedObject
    private var viewModel: AnimeDetailsViewModel
    let anime: AnimeItem
    
    init(anime: AnimeItem) {
        self.anime = anime
        self.viewModel = .init(animeId: anime.model.mal_id)
    }
    
    var body: some View {
        Group {
            if case let .error(error) = self.viewModel.episodesState {
                ReloadView(message: error, handler: { viewModel.onAppear() })
            } else if case .loading = self.viewModel.episodesState {
                HStack {
                    ProgressView("Loading..")
                }
            } else {
                ScrollView {
                    VStack(alignment: .center) {
                        ZStack(alignment: .bottomTrailing) {
                            WebImage(url: anime.imageUrl)
                                .frame(height: 550)
                                .cornerRadius(6)
                            HStack {
                                Text("Trailer")
                                    .font(.title2)
                                Image(systemName: "arrowtriangle.right.fill")
                                
                            }
                            .frame(width: 100, height: 30)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                            .padding(.horizontal, .zero)
                            .padding(.vertical, 6)
                        }
                        
                        VStack(spacing: .zero) {
                            Text(viewModel.anime.synopsis.defaultIfEmpty).padding()
                                .frame(maxHeight: 97)
                            Button("SERIES DETAILS", action: viewModel.didTapDetailsButton())
                        }
                        
                        Form {
                            Section(header:
                                        HStack {
                                            Text("Episodes")
                                                .font(.title2)
                                            Spacer()
                                        }
                                        .padding(.vertical, 6)
                            ) {
                                ForEach(self.viewModel.episodesState.items, id: \.self) { episode in
                                    Link(destination: URL(string: episode.video_url)!) {
                                        EpisodeRow(episode: episode)
                                    }.buttonStyle(PlainButtonStyle())
                                }
                                .cornerRadius(6)
                            }
                        }.frame(height: 500)
                        
                    }
                }
            }
        }.onAppear { viewModel.onAppear() }
        .navigationBarTitle(anime.title, displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct AnimeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnimeDetailsView(anime: .init(model: .example))
        }
    }
}
