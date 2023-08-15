//
//  AuthRouter.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 24/03/23.
//

import Foundation
import SwiftUI

public enum AuthRouter: NavigationRouter {
    case login
    
    public var transition: NavigationTransitionStyle {
        switch self{
        case .login:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .login:
            LogIn()

        }
    }
}
