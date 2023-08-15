//
//  DetailButtons.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 21/07/23.
//

import SwiftUI

//struct DetailButtons: View {
//    @EnvironmentObject var CharCoordinator: Coordinator<CharacterRouter>
//    
//    talvez eu tenha que fazer um state interno que seja igual ao state do marvelCharacter. FAzer isso no favoriteButton
//    @Binding var char: MarvelCharacter
//    var body: some View {
//        HStack(alignment: .center){
//            Button {
//                CharCoordinator.pop()
//            } label: {
//                Image("arrow_back")
//            }
//            Spacer()
//            FavoriteButton(Char: char)
//        }.padding(.leading, 16)
//            .background{
//                LinearGradient(gradient: Gradient(colors: [.black,.black.opacity(0.4), .black.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
//            }
//    }
//}
//
//struct DetailButtons_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailButtons(char: .constant(CharUI.shared.mockedChar))
//    }
//}
