//
//  FavoriteButton.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 18/07/23.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    var viewModel = HomeViewModel.shared
    var favoriteViewModel = FavoriteViewModel.shared
    @ObservedObject var Char: MarvelCharacter
    var body: some View {
        Button(action: {
            viewModel.updateFavorite(with: Char)
            //favoriteViewModel.getFavorites()
        }) {
            Image(Char.isFavorite ? "ic_favorite_checked" :"ic_favorite_unchecked")
        }.padding(16)
    }
}
