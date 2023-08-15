//
//  MarvelHeader.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 27/03/23.
//

import SwiftUI

struct MarvelHeader: View {
    var body: some View {
        ZStack{
            Color.marvelRed.ignoresSafeArea()
            Image("marvelLogo")
                .resizable()
                .frame(width: 100, height: 35, alignment: .center)
                .scaledToFit()
            
        }.frame(height: 64)
    }
}

struct MarvelHeader_Previews: PreviewProvider {
    static var previews: some View {
        MarvelHeader()
    }
}
