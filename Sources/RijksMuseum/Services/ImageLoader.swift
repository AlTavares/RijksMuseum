//
//  ImageLoader.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import Combine
import SwiftUI
import UIKit

class ImageLoader: ObservableObject {
    @Published var image = UIImage()
    private static let cache = ImageCache()
    private var task: AnyCancellable?

    func loadImage(from url: URLConvertible) {
        task?.cancel()
        guard let url = url.url else { return }
        if let image = ImageLoader.cache[url] {
            self.image = image
        }
        task = URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in
                UIImage(data: data)
            }
            .replaceError(with: nil)
            .compactMap({ $0 })
            .receive(on: DispatchQueue.main)
            .cache(to: ImageLoader.cache, key: url)
            .assign(to: \.image, on: self)
    }
}
