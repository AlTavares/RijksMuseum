//
//  HTTPClient.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import Combine
import Foundation

class HTTPClient {
    enum RequestError: Swift.Error {
        case unableToCreateRequest
    }

    @Locatable private var urlSession: URLSession

    func perform<T: Decodable>(request: Request) -> AnyPublisher<T, Error> {
        guard let request = request.asURLRequest() else {
            return Fail<T, Error>(error: RequestError.unableToCreateRequest)
                .eraseToAnyPublisher()
        }

        logger.debug(request.curlString)

        return urlSession.dataTaskPublisher(for: request)
            .tryMap { data, _ in
                try JSONDecoder().decode(T.self, from: data)
            }
            .logErrors()
            .eraseToAnyPublisher()
    }
}
