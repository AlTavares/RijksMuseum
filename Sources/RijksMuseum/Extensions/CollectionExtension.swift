//
//  CollectionExtension.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import Foundation

extension Array {
    func appending(_ element: Element) -> Self {
        var array = self
        array.append(element)
        return array
    }
}
