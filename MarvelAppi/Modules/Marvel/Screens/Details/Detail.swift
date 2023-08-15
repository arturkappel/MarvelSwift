//
//  Detail.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 23/03/23.
//

import SwiftUI

struct Detail: View {
    @EnvironmentObject var CharCoordinator: Coordinator<CharacterRouter>
    @ObservedObject var char: MarvelCharacter
    var body: some View {
        VStack(alignment: .leading){
            ZStack {
                AsyncImage(url: char.thumbnail?.url) { image in
                    image.resizable(resizingMode: .stretch)
                } placeholder: {
                    Image("marvel")
                        .resizable()
                }.border(.black, width: 3)
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Button {
                            CharCoordinator.pop()
                        } label: {
                            Image("arrow_back")
                        }
                        Spacer()
                        FavoriteButton(Char: char)
                    }.padding(.leading, 16)
                        .background{
                            LinearGradient(gradient: Gradient(colors: [.black,.black.opacity(0.4), .black.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                        }
                    Spacer()
                    Text("\(char.name)")
                        .foregroundColor(.white)
                        .padding()
                }
                
                    
            }.frame(height: 350)
            Text("\(char.description ?? "Not found")")
                .foregroundColor(.white)
                .padding()
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            .background(){
                BackgroundImage()
            }
            
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(char: CharUI.shared.mockedChar)
    }
}
