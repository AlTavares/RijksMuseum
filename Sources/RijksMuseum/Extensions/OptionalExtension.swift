//
//  OptionalExtension.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import Foundation

struct NilError: Error {}

extension Optional {
    func unwrap(or error: @autoclosure () -> Error = NilError()) throws -> Wrapped {
        switch self {
        case .some(let w): return w
        case .none: throw error()
        }
    }
}
