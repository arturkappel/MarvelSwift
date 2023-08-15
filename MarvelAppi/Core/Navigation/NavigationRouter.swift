//
//  NavigationRouter.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 24/03/23.
//

import Foundation
import SwiftUI

public protocol NavigationRouter {
    associatedtype V: View
    
    var transition: NavigationTransitionStyle { get }
    
    @ViewBuilder
    func view() -> V
}
