//
//  RequestResponse.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation

enum RequestResponse <D: Decodable, E: Error & Codable> {
    case success(D)
    case customError(E)
    case failure(RequestError)
}
