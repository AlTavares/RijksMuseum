//
//  CollectionRepository.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import Combine
import Foundation

class CollectionRepository {
    @Locatable private var config: Config
    @Locatable private var httpClient: HTTPClient
    var defaultQueryItems: QueryItems { [
        "key": config.apiKey,
        "format": "json",
    ] }

    // https://www.rijksmuseum.nl/api/<language>/collection?q=<term>&key=<key>&format=json
    func search(for term: String) -> AnyPublisher<ColletionSearchResponse, Error> {
        let request = Request(host: config.localizedHost(),
                              path: "/collection",
                              queryItems: defaultQueryItems + ["q": term])
        return httpClient.perform(request: request)
    }

    // https://www.rijksmuseum.nl/api/<language>/collection/<objectNumber>?key=<key>&format=json
    func getDetail(objectNumber: String) -> AnyPublisher<ArtDetailResponse, Error> {
        let request = Request(host: config.localizedHost(),
                              path: "/collection/\(objectNumber)",
                              queryItems: defaultQueryItems)
        return httpClient.perform(request: request)
    }
}
