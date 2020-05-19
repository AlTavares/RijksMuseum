//
//  ArtDetailViewModel.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import Combine
import CoreGraphics
import Foundation

class ArtDetailViewModel: ObservableObject {
    init(objectID: String) {
        self.objectNumber = objectID
    }

    private var bag = CancelBag()

    var objectNumber: String {
        didSet { load() }
    }

    @Locatable private var repository: CollectionRepository
    @Published var state: ValueState<ArtDetailViewData> = .idle

    func load() {
        state = .loading
        repository.getDetail(objectNumber: objectNumber)
            .map(ArtDetailViewData.init)
            .map(ValueState.loaded)
            .catch { Just(ValueState.error($0)) }
            .receive(on: DispatchQueue.main)
            .assign(to: \.state, on: self)
            .store(in: &bag)
    }
}


