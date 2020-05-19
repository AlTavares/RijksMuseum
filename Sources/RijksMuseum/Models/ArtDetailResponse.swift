//
//  ArtDetailResponse.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import Foundation

// MARK: - ArtDetailResponse

struct ArtDetailResponse: Codable, Equatable {
    let elapsedMilliseconds: Int
    let artObject: ArtObjectDetail
    let artObjectPage: ArtObjectPage
}

// MARK: - ArtObjectDetail

struct ArtObjectDetail: Codable, Equatable {
    let title, longTitle: String
    let scLabelLine: String
    let label: Label
    let webImage: ImageResponse?
}

// MARK: - ArtObjectPage

struct ArtObjectPage: Codable, Equatable {
    let plaqueDescription: String?
}


// MARK: - Label
struct Label: Codable, Equatable {
    let title, makerLine, labelDescription, notes, date: String?

    enum CodingKeys: String, CodingKey {
        case title, makerLine
        case labelDescription = "description"
        case notes, date
    }
}
