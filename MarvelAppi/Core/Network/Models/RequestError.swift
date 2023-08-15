//
//  RequestError.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation

struct RequestError: Codable, Error {
    
    var statusCode: Int?
    var error: String?
    var data: Data?
}

struct CustomError: Codable, Error {
    struct response {
        var statusCode: Int?
        var error: String?
        var data: Data
    }
}
