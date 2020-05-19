//
//  ErrorExtension.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import Foundation

extension Error {
    var errorDescription: String? {
        (self as? LocalizedError)?.errorDescription
    }
}


