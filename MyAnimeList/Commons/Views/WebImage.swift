//
//  WebImage.swift
//  MyAnimeList
//
//  Created by Firas AlKahlout on 9/26/20.
//

import SwiftUI

struct WebImage: View {
    let url: String
    @State private var imageData: Data = .init()
    
    var body: some View {
        if imageData.count == 0 {
            ProgressView().onAppear { self.loadImage() }
        } else {
            Image(uiImage: UIImage(data: imageData)!)
                .resizable()
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        WebImage(url: Anime.example.images.jpg.large_image_url.defaultIfEmpty)
    }
}
