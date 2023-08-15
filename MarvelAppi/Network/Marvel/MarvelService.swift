//
//  MarvelService.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation
import Alamofire

class MarvelService {
    var network = CoreNetwork()
}

extension MarvelService: MarvelServiceProtocol {
    func getCharacters(Parameters: [String: Any]?) async -> RequestResponse<MarvelCharactersResponse, RequestError> {
        return await network.request(endpoint: Endpoints.characters.rawValue,
                                     method: .get,
                                     Parameters: Parameters,
                                     interceptors: MarvelInterceptor(),
                                     ResponseType: MarvelCharactersResponse.self,
                                     ErrorType: RequestError.self)
    }
    
    
}
