//
//  Cell.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 22/03/23.
//

import SwiftUI

struct Cell: View {
    @EnvironmentObject var CharCoordinator: Coordinator<CharacterRouter>
    @ObservedObject var Char: MarvelCharacter
    var body: some View {

        ZStack(alignment: .topTrailing){
            Button(action: goToDetails){
                ZStack(alignment: .bottom){
                    AsyncImage(url: Char.thumbnail?.url) { image in
                        image.resizable(resizingMode: .stretch)
                    } placeholder: {
                            Image("marvel")
                                .resizable()
                        }.border(.black, width: 3)
                        Image("Rectangle2")
                            .resizable()
                            .frame(height: 62)
                        Text(Char.name)
                            .padding(.horizontal, 12)
                            .frame(height:62, alignment: .center)
                }
            }.tint(.black)
            
            FavoriteButton(Char: Char)
        }.frame(height: 240)
            .border(.black, width: 3)
    }
        
    func goToDetails() -> Void{
        CharCoordinator.show(.detail(char: Char))
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(Char: CharUI.shared.mockedChar)
    }
}
