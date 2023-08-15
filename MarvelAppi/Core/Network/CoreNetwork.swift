//
//  CoreNetwork.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation
import Alamofire

class CoreNetwork: CoreNetworkProtocol {
    func request<R: Decodable, E: Decodable>
    (endpoint: String, method: Alamofire.HTTPMethod, Parameters: [String: Any]? , interceptors: RequestInterceptor ,ResponseType: R.Type, ErrorType: E.Type)
            async -> RequestResponse<R, E> {
        let task = AF.request(baseURL.appending(endpoint),
                              method: method,
                              parameters: Parameters,
                              interceptor: interceptors).serializingDecodable(R.self)
                
        
        let response = await task.response
                print(response.response?.statusCode)
        // i can check the response.response to see the status code and check for any internal APIError
        switch response.result {
        case .success(let response):
                print("success")
            
            //if i want to add the isFavorite and return it i can decode the *result* into my new struct
            return .success(response)
        case .failure(let error):
            guard let data = response.data,
                  let serializedError = try? JSONDecoder().decode(ErrorType, from: data) else {
                return .failure(RequestError(statusCode: error.responseCode, error: error.errorDescription, data: response.data))
            }
        
            return .customError(serializedError)
        }
        
    }
    
    var baseURL: String = "https://gateway.marvel.com/v1/public/"
    
    
}
