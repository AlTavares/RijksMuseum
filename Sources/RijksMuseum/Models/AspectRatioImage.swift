//
//  AspectRatioImage.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import CoreGraphics
import Foundation

struct AspectRatioImage {
    var url: String
    var width, height: Int

    var aspectRatio: CGFloat? {
        guard width != 0, height != 0 else { return nil }
        return width.f / height.f
    }
}

extension AspectRatioImage {
    init?(from image: ImageResponse?) {
        guard let image = image, let url = image.resizedUrl else { return nil }
        self.init(url: url, width: image.width, height: image.height)
    }
}
