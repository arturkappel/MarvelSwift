//
//  CustomizeButton.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 30/03/23.
//

import Foundation
import SwiftUI

struct CustomizedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(16)
            .foregroundColor(.white)
            .background(Capsule().fill(Color.marvelBlack))
            }
    
    
}

