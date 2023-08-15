//
//  Favorite.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 23/03/23.
//

import SwiftUI

struct Favorite: View {
    var body: some View {
        VStack(spacing: 0){
            MarvelHeader()
            FavoriteList()
        }
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}
