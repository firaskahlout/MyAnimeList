//
//  TopAnimeView.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/23/20.
//

import SwiftUI

struct TopAnimeView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel = TopAnimeViewModel()
    
    // MARK: Body
    
    var body: some View {
        List(self.viewModel.animes, id: \.self) { item in
            Text(item.title)
        }
        .onAppear { viewModel.onAppear() }
    }
}

// MARK: - TopAnimeView_Previews

struct TopAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        TopAnimeView()
    }
}
