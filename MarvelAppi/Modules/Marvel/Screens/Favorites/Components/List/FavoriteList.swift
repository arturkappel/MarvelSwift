//
//  FavoriteList.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 27/03/23.


import SwiftUI

struct FavoriteList: View {
    let columns = [GridItem()]
    @StateObject var viewModel = FavoriteViewModel.shared
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(viewModel.favorites, id:\.self){ char in
                        Cell(Char: char)
                }
            }.padding(.horizontal, 16)
        }.background(){
            BackgroundImage()
        }
//        .onAppear(){
//            viewModel.getFavorites()
//        }

    }
    
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}
