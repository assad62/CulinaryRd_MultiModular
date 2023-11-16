//
//  AsyncHttpClient.swift
//  RemoteAPI
//
//  Created by Development on 8/11/2023.
//

import Foundation


public protocol AsyncHttpClient: HttpClient{
    func execute(request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

extension URLSession: AsyncHttpClient{
    
    struct InvalidAsyncHTTPResponseError: Error {}
    
    public func execute(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        
        let (data, result) = try await data(for: request)
        
        guard let httpResponse = result as? HTTPURLResponse  else {
           
            throw InvalidCombineHTTPResponseError()
        }
        
        
        return (data, httpResponse)
        
    }
    
    
}
