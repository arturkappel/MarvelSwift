//
//  HeroList.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 22/03/23.
//

import SwiftUI

struct HeroList: View {
    @StateObject var viewModel = HomeViewModel.shared
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(viewModel.char.indices, id:\.self){ index in
                    let char = viewModel.char[index]
                    Cell(Char:char)
                        .onAppear{
                            Task{
                                await viewModel.loadMoreChar(index: index)
                            }  
                        }
                }
            }.onAppear(){
                print("appear")
            }
            .padding(.horizontal, 8)
        }
        .background(){
            BackgroundImage()
        }

    }
}

struct HeroList_Previews: PreviewProvider {
    static var previews: some View {
        HeroList()
    }
}


