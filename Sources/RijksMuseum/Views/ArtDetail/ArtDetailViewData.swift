//
//  ArtDetailViewData.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import Foundation

struct ArtDetailViewData {
    var title: String
    var longTitle: String
    var image: AspectRatioImage?
    var plaqueDescription: String?
    var label: String
}

extension ArtDetailViewData {
    init(from response: ArtDetailResponse) {
        self.init(title: String(response.artObject.title.prefix(while: { $0 != ";" })),
                  longTitle: response.artObject.longTitle,
                  image: AspectRatioImage(from: response.artObject.webImage),
                  plaqueDescription: response.artObject.label.labelDescription ?? response.artObjectPage.plaqueDescription,
                  label: response.artObject.scLabelLine)
    }
}
