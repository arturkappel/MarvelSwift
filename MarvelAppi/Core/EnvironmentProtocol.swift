//
//  EnvironmentProtocol.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 15/08/23.
//

import Foundation

protocol EnvironmentProtocol: AnyObject {
    var infoDictionary: [String: Any] { get }
    
    var baseURL: String { get }
    
    var publicKey: String  { get }

    var privateKey: String  { get }
}
