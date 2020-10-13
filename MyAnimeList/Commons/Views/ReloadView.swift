//
//  ReloadView.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 10/12/20.
//

import SwiftUI

struct ReloadView: View {
    let message: String
    let handler: Handler
    
    var body: some View {
        VStack {
            Text(message)
            Button(action: handler, label: {
                Image("reload")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                
            })
        }
    }
}

struct ReloadView_Previews: PreviewProvider {
    static var previews: some View {
        ReloadView(message: "Anime.example.synopsis.defaultIfEmpty") {
            print("Clicked..")
        }
    }
}
