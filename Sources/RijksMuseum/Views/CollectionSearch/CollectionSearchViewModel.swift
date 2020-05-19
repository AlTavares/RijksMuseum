//
//  CollectionSearchViewModel.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 18/05/20.
//

import Combine
import Foundation

class CollectionSearchViewModel: ObservableObject {
    private var bag = CancelBag()
    @Locatable private var repository: CollectionRepository
    @Published var state: ValueState<[ArtItemViewData]> = .idle

    func search(for term: String) {
        state = .loading

        repository.search(for: term)
            .map { response in
                ValueState.loaded(response.artObjects.map(ArtItemViewData.init))
            }
            .catch { Just(ValueState.error($0)) }
            .receive(on: DispatchQueue.main)
            .assign(to: \.state, on: self)
            .store(in: &bag)
    }
}
