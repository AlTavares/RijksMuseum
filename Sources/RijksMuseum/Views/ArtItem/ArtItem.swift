//
//  ArtItem.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 16/05/20.
//

import SwiftUI

struct ArtItem: View {
    var viewData: ArtItemViewData
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            URLImageView(url: viewData.image?.url)
                .aspectRatio(viewData.image?.aspectRatio ?? 2, contentMode: .fit)
                .frame(maxWidth: .infinity)
            Text(viewData.title)
                .bold()
            Text(viewData.maker)
                .italic()
        }
    }
}

struct ArtItem_Previews: PreviewProvider {
    static var previews: some View {
        ArtItem(viewData: ArtItemViewData(
            id: "0",
            objectNumber: "0",
            title: "The Threatened Swan; Interpreted later as an Allegory on Johan de Witt",
            image: .init(url: "https://lh3.googleusercontent.com/tm1DbZrAP0uBM-OJhLwvKir1Le5LglRF_bvbaNi6m-F_pIyttsWQz040soRY9pWA9PgNEYFA_fBkg_keYixRXCAjz9Q=w800",
                         width: 2916,
                         height: 2459),
            maker: "Jan Asselijn"
        ))
    }
}
