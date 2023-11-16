//
//  CombineHttpClient.swift
//  RemoteAPI
//
//  Created by Development on 8/11/2023.
//

import Foundation
import Combine

public protocol CombineHttpClient:HttpClient {
    func execute(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse),Error>
}

extension URLSession:CombineHttpClient{
    struct InvalidCombineHTTPResponseError: Error {}
    
    public func execute(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error> {

        return dataTaskPublisher(for: request)
        
            .tryMap { result in
              
                guard let httpResponse = result.response as? HTTPURLResponse  else {
                   
                    throw InvalidCombineHTTPResponseError()
                }
               
                return (result.data, httpResponse)
            }
            
            .eraseToAnyPublisher()
    }
    
    
}
