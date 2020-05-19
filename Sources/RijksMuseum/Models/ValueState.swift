//
//  ValueState.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import Foundation

enum ValueState<Value> {
    case idle
    case loading
    case loaded(Value)
    case error(Error)

    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
}
