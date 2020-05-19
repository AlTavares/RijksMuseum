//
//  ArtDetailView.swift
//  RijksMuseum
//
//  Created by Alexandre Mantovani Tavares on 19/05/20.
//

import SwiftUI

struct ArtDetailView: View {
    @ObservedObject var viewModel: ArtDetailViewModel
    var body: some View {
        DefaultStateView(state: viewModel.state,
                         idleView: { Color.white.eraseToAnyView() },
                         loadedView: view)
            .onAppear(perform: viewModel.load)
    }

    private func view(for item: ArtDetailViewData) -> AnyView {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                URLImageView(url: item.image?.url)
                    .aspectRatio(item.image?.aspectRatio ?? 2, contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(item.longTitle).bold()
                Text(item.plaqueDescription ?? "")
                Text(item.label).italic()
                Spacer()
            }.padding()
        }
        .navigationBarTitle(Text(item.title), displayMode: .inline)
        .eraseToAnyView()
    }
}

struct ArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtDetailView(viewModel: .init(objectID: "SK-A-4"))
    }
}
