//
//  CharacterRouter.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 24/03/23.
//

import Foundation
import SwiftUI

enum CharacterRouter: NavigationRouter {
    case home
    case detail(char: MarvelCharacter)
    case login
    
    public var transition: NavigationTransitionStyle {
        switch self{
        case .login:
            return .push
        case .home:
            return .push
        case .detail:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .login:
            LogIn()
        case .home:
            ContentView()
        case .detail(char: let char):
            Detail(char: char)
        }
    }
}
