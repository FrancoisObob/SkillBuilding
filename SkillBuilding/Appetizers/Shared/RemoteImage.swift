//
//  RemoteImage.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/13/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage else {
                return
            }

            DispatchQueue.main.async {
                self.image = .init(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?

    var body: some View {
        (image ?? Image("food-placeholder"))
            .resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(from: urlString)
            }
    }
}
