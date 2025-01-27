//
//  CancelBag.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import Foundation
import Combine

typealias CancelBag = Set<AnyCancellable>

extension CancelBag {
    mutating func collect(@Builder _ cancellables: () -> [AnyCancellable]) {
        formUnion(cancellables())
    }

    @_functionBuilder
    struct Builder {
        static func buildBlock(_ cancellables: AnyCancellable...) -> [AnyCancellable] {
            return cancellables
        }
    }
}
