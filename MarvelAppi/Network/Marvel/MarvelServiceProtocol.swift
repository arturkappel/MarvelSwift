//
//  MarvelServiceProtocol.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation

protocol MarvelServiceProtocol: AnyObject {
    func getCharacters(Parameters: [String: Any]?) async -> RequestResponse<MarvelCharactersResponse, RequestError>
}
