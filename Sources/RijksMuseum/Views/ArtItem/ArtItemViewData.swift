//
//  ArtItemViewData.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import CoreGraphics
import Foundation

struct ArtItemViewData: Identifiable {
    var id: String
    var objectNumber: String
    var title: String
    var image: AspectRatioImage?
    var maker: String
}

extension ArtItemViewData {
    init(from artObject: ArtObject) {
        self.init(id: artObject.id,
                  objectNumber: artObject.objectNumber,
                  title: artObject.title,
                  image: AspectRatioImage(from: artObject.webImage),
                  maker: artObject.principalOrFirstMaker)
    }
}
