//
//  CollectionSearchView.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import SFSafeSymbols
import SwiftUI

struct CollectionSearchView: View {
    @ObservedObject var viewModel = CollectionSearchViewModel()
    @State var searchTerm: String = ""
    var body: some View {
        NavigationView {
            VStack {
                searchBar
                DefaultStateView(state: viewModel.state,
                                 idleView: Color.white.eraseToAnyView,
                                 loadedView: list,
                                 retryHandler: search)
                    .frame(maxHeight: .infinity)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .accentColor(.black)
        .onAppear {
            self.search()
        }
    }

    var searchBar: some View {
        HStack {
            TextField("Search", text: $searchTerm)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading)
                .border(Color.clear)
            Button(action: search) {
                Image(systemSymbol: .magnifyingglass)
                    .foregroundColor(.black)
            }.padding()
        }
        .frame(height: 60)
        .colorInvert()
        .background(Color.black.edgesIgnoringSafeArea(.top))
    }

    private func list(of items: [ArtItemViewData]) -> AnyView {
        guard items.count > 0 else {
            return Text("Nothing found").eraseToAnyView()
        }
        return List(items) { item in
            NavigationLink(destination: ArtDetailView(viewModel: .init(objectID: item.objectNumber))) {
                VStack {
                    Spacer(minLength: 16)
                    ArtItem(viewData: item)
                    Spacer(minLength: 16)
                }
            }
        }.eraseToAnyView()
    }

    private func search() {
        viewModel.search(for: searchTerm)
        endEditing()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionSearchView()
    }
}
