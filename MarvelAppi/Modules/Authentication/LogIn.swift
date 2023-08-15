//
//  LogIn.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 24/03/23.
//

import SwiftUI

struct LogIn: View {
    @EnvironmentObject var CharCoordinator: Coordinator<CharacterRouter>
    var body: some View {
        Button("Login"){
            CharCoordinator.show(.home)
        }.buttonStyle(CustomizedButton())
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
