//
//  ViewExtension.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }

    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
