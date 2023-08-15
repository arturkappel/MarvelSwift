//
//  CoreNetworkProtocol.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation
import Alamofire

protocol CoreNetworkProtocol: AnyObject {
    var  baseURL: String { get }
    
    func request<R: Decodable,
                 E: Decodable>(
                    endpoint: String,
                    method: Alamofire.HTTPMethod,
                    Parameters: [String: Any]?,
                    interceptors: RequestInterceptor,
                    ResponseType: R.Type,
                    ErrorType: E.Type) async -> RequestResponse<R, E> 
                    
    
    
}
