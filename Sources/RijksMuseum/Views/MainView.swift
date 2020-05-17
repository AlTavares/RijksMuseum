//
//  MainView.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        URLImageView(url: "https://www.kingarthurflour.com/sites/default/files/styles/featured_image_2x/public/recipe_legacy/92-3-large.jpg?itok=qyQmtRoQ")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
