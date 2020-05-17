//
//  URLImage.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 16/05/20.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject private var imageLoader = ImageLoader()
    init(url: URLConvertible) {
        imageLoader.loadImage(from: url)
    }

    var body: some View {
        Image(uiImage: imageLoader.image)
            .resizable()
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "https://www.kingarthurflour.com/sites/default/files/styles/featured_image_2x/public/recipe_legacy/92-3-large.jpg")
            .scaledToFit()
    }
}

