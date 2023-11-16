//
//  CatListService.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation
import Combine
import RemoteAPI

protocol CatListDecorator:CombineAPISerivce{
     func loadList(request: URLRequest) -> AnyPublisher<[Category],Error>
}



public struct CatListService:CatListDecorator {
    
    
    var httpClient: RemoteAPI.CombineHttpClient
    
    public init(httpClient: RemoteAPI.CombineHttpClient) {
        self.httpClient = httpClient
    }
    
    func loadList(request: URLRequest) ->  AnyPublisher<[Category],Error> {
        
        return httpClient
                .execute(request: request)
                .tryMap(CatListMap.map)
                .compactMap({$0})
                .eraseToAnyPublisher()
       
    }
    
}
