//
//  Home.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 23/03/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var coordinator: Coordinator<CharacterRouter>
    var viewModel = HomeViewModel.shared
    
    var body: some View {
        
        VStack(spacing: 0.0){
            HomeHeader()
            OrderingHeader()
            Button("Fetch Data") {
                Task{
                  
                    await viewModel.getCharacters()
                }
            }
            HeroList()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
