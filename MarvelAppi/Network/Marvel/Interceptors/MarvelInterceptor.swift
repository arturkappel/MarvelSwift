//
//  MarvelInterceptor.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 11/07/23.
//

import Foundation
import Alamofire
import CryptoKit

class MarvelInterceptor: RequestInterceptor {
    
    var env: EnvironmentProtocol

    var publicKey: String {env.publicKey}
    var privateKey: String {env.privateKey}

    init(env: EnvironmentProtocol = Environment()){

        self.env = env
    }
    
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let ts = String(Date().timeIntervalSince1970)
        let parameters = MarvelDefaultParameters( apikey: self.publicKey, hash: md5(from: ts + self.privateKey + self.publicKey), ts: ts)
        
        guard let url = urlRequest.url,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return
        }
        
        print("ENTREIIII")
        print(parameters.hash)
        print("private key \(self.privateKey)")
        
        
        var urlRequest = urlRequest
        
        
        let query = [URLQueryItem(name: "apikey" , value: parameters.apikey),
                          URLQueryItem(name: "hash" , value: parameters.hash),
                          URLQueryItem(name: "ts" , value: parameters.ts)]
        
        print(self.privateKey)
        
        guard let queryItem = urlComponents.queryItems else {return}
        
        urlComponents.queryItems = queryItem + query
            
        urlRequest.url = urlComponents.url
        
        completion(.success(urlRequest))
        
    }
    
    private func md5(from string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
