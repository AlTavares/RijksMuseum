//
//  HTTPMethod.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible {
    case get, post, patch, put, delete

    var description: String {
        rawValue.uppercased()
    }
}
