//
//  Request.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import Foundation

typealias HTTPHeaders = [String: String]
typealias QueryItems = [URLQueryItem]

struct Request: Hashable, CustomStringConvertible {
    var host: String
    var path: String
    var method: HTTPMethod = .get
    var queryItems: QueryItems = QueryItems()
    var headers: HTTPHeaders = HTTPHeaders()
    var shouldRetry: Bool = false
}

extension Request {
    var description: String {
        return "\(method) \(host)\(path)"
    }

    func asURLRequest() -> URLRequest? {
        guard var components = URLComponents(string: host) else { return nil }
        components.path.append(path)
        components.queryItems = queryItems + (components.queryItems ?? [])
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.description
        request.allHTTPHeaderFields = headers
        return request
    }
}

extension QueryItems: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, String?)...) {
        self = elements.map { key, value in
            URLQueryItem(name: key, value: value)
        }
    }
}
