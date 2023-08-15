//
//  HomeModelView.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 28/03/23.
//

import Foundation
import SwiftUI
@MainActor
class HomeViewModel: ObservableObject{
    
    static let shared = HomeViewModel()
    private var marvelService = MarvelService()
    private var favoriteViewModel = FavoriteViewModel.shared
    private var Char = CharUI.shared
    
    
    @Published var char: [MarvelCharacter] = []
    
    private var page: Int = 0
    private var limit: Int = 8
    private var nextPageFirstItemIndex: Int {
        return page * limit
    }
    private var total = 300
    
    func getCharacters() async {
        let response = await self.marvelService.getCharacters(Parameters: ["limit": limit, "offset": nextPageFirstItemIndex])
        
        switch response{
        case .success(let charResponse):
            print(charResponse.data.limit, charResponse.data.offset)
            let marvelReponseData = charResponse.data
            let modifiedChars = makeIsFavoriteBool(of: marvelReponseData.results)
            Char.chars = modifiedChars
            char.append(contentsOf: Char.chars)
        case .customError(let error), .failure(let error):
            print("Error \(error)")
        }
    }
    
    func loadMoreChar(index: Int) async {
        let calc = nextPageFirstItemIndex + limit - 1
        let isLastOfTheList: Bool = index == calc;
        
        if isLastOfTheList {
            print("INDEX \(index)")
            incrementPage()
            await getCharacters()
            
        }
    }
    
    private func incrementPage() {
        page += 1
    }
    
    private func makeIsFavoriteBool(of chars: [MarvelCharacter]) -> [MarvelCharacter]{
        let chars = chars
        chars.indices.forEach { index in
            let nonNilValue = chars[index].isFavorite
            chars[index].isFavorite = nonNilValue
        }
        return chars
    }
    
    func updateFavorite(with character: MarvelCharacter){
        Char.toogleFavorite(with: character)
        favoriteViewModel.getFavorites()
        print("Char in the viewmodel")
    }
    
    func filterCharByName(of string: String) {
        let filteredChar = Char.chars.filter { character in
            return character.name.lowercased().hasPrefix(string.lowercased())
        }
        print(filteredChar)
        
        self.char = filteredChar
    }
    
    func filterByAlphabet(order type: FilterType){
        switch type {
        case .ascending:
            print("entered ascending")
            self.char.sort {
                $0.name > $1.name
            }
        case .descending:
            print("entered descending")
            self.char.sort {
                $0.name < $1.name
            }
        }
    }

    
//    private func updateCharInScreen(with char: [MarvelCharacter]){
//        self.char = char
//    }
    
    
}
