//
//  SceneDelegate.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 24/03/23.
//

import Foundation
import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
        
    private let CharCoordinator: Coordinator<CharacterRouter> = .init(startingRoute: .login)
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CharCoordinator.navigationController
        window?.makeKeyAndVisible()
        CharCoordinator.start()
    }
}
