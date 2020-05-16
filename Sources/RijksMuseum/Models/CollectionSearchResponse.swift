import Foundation

// MARK: - ColletionSearchResponse

struct ColletionSearchResponse: Codable, Equatable {
    let elapsedMilliseconds, count: Int
    let countFacets: CountFacets
    let artObjects: [ArtObject]
    let facets: [Facet]
}

// MARK: - ArtObject

struct ArtObject: Codable, Equatable {
    let links: Links
    let id, objectNumber, title: String
    let hasImage: Bool
    let principalOrFirstMaker, longTitle: String
    let showImage, permitDownload: Bool
    let webImage, headerImage: Image
    let productionPlaces: [String]
}

// MARK: - Image

struct Image: Codable, Equatable {
    let guid: String
    let offsetPercentageX, offsetPercentageY, width, height: Int
    let url: String
}

// MARK: - Links

struct Links: Codable, Equatable {
    let linksSelf, web: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case web
    }
}

// MARK: - CountFacets

struct CountFacets: Codable, Equatable {
    let hasImage, onDisplay: Int

    enum CodingKeys: String, CodingKey {
        case hasImage = "hasimage"
        case onDisplay = "ondisplay"
    }
}

// MARK: - Facet

struct Facet: Codable, Equatable {
    let facets: [KeyValuePair]
    let name: String
    let otherTerms, prettyName: Int
}

// MARK: - KeyValuePair

struct KeyValuePair: Codable, Equatable {
    let key: String
    let value: Int
}
