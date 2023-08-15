//
//  FavoriteViewModel.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 01/08/23.
//

import Foundation

@MainActor
class FavoriteViewModel: ObservableObject {
    @Published var favorites: [MarvelCharacter] = []
    
    static let shared = FavoriteViewModel()
    private var marvelService = MarvelService()
    
    private var Char = CharUI.shared
    
    
    func getFavorites() {
        self.favorites = Char.FavoriteChar
    }
    
}
