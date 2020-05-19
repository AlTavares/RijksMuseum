//
//  Configurator.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import Foundation

func configure<T>(_ value: T,
                  using closure: (inout T) throws -> Void) rethrows -> T {
    var value = value
    try closure(&value)
    return value
}
