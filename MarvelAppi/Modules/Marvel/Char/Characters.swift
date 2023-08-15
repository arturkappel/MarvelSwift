//
//  Characters.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 14/07/23.
//

import Foundation
import SwiftUI

enum MyError: Error {
    case charNotFound
}

class CharUI{
    static var shared = CharUI()
    
     var chars : [MarvelCharacter] = [] {
        didSet{
            print("setou chars")
        }
    }
    
    var FavoriteChar: [MarvelCharacter] = [] {
        didSet{
            print("setou favorite char")
        }
    }
    
    
    func toogleFavorite(with character: MarvelCharacter){
        var updatedChar = character
        updatedChar.isFavorite.toggle()
        
        
        updateHomeChar(with: updatedChar)
        updateFavoriteLists(with: updatedChar)
    }
    
    func appendChar(with character: [MarvelCharacter]){
        chars.append(contentsOf: character)
    }
    
    private func updateIncomingDataWithSavedFavorite(data: [MarvelCharacter]){
        // TODO - When Implement the save favorites be able to update the  home screen with it
    }
    
    private func updateFavoriteLists(with character: MarvelCharacter){
        let isFavorite = character.isFavorite
        if (isFavorite){
            FavoriteChar.append(character)
        }else{
            guard let index = FavoriteChar.firstIndex(where: {$0.id == character.id}) else {
                print("Unable to find char to delete from favorite")
                return
            }
            FavoriteChar.remove(at: index)
        }
    }
    
    private func updateHomeChar(with character: MarvelCharacter){
        guard let index = chars.firstIndex(where: {$0.id == character.id}) else {
            print("Unable to find char to change the favorite")
            return
        }
        chars[index] = character
}
    

    
    var mockedChar = MarvelCharacter(id: 1, name: "Hello", description: "Very top char", thumbnail: nil)
        
    
    
}
