//
//  HomeHeader.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 22/03/23.
//

import SwiftUI

struct HomeHeader: View {
    @ObservedObject var viewModel = HomeViewModel.shared
    @State var isSearchSelected: Bool = false
    @State var text: String = ""
    
    var body: some View {
        HStack{
            ZStack(alignment: .trailing){
                MarvelHeader()
                
                TextField("Gello",text: $text)
                    .onChange(of: text) { newValue in
                        print(newValue)
                        viewModel.filterCharByName(of: newValue)
                    }
                    
                
                Button {
                    isSearchSelected.toggle()
                    print(isSearchSelected)
                } label: {
                    Image("magnifyingGlass")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .scaledToFit()
                        .padding(.horizontal)
                }


            }
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
    }
}
