//
//  BackgroundImage.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 21/07/23.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        ZStack{
            Color.marvelBlack
            Image("background_image")
                .resizable()
                .frame(width: .infinity, height: .infinity, alignment: .center   )
        }
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
