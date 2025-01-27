//
//  URLRequestExtension.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import Foundation

public extension URLRequest {
    /**
     Returns a cURL command representation of this URL request.
     */
    var curlString: String {
        guard let url = url else { return "" }
        var baseCommand = "curl '\(url.absoluteString)'"

        if httpMethod == "HEAD" {
            baseCommand += " --head"
        }

        var command = [baseCommand]

        if let method = httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }

        if let headers = allHTTPHeaderFields {
            for (key, value) in headers {
                command.append("-H '\(key): \(value)'")
            }
        }

        if let data = httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }

        return command.joined(separator: " \\\n\t").appending(" | jq")
    }
}
