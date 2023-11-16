//
//  TopRecipiesListService.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation
import RemoteAPI



protocol TopRecipesListDecorator:AsyncAPIService{
     func loadList(request: URLRequest) async -> ([Meals],Error)
}


public class TopRecpiesListService: TopRecipesListDecorator{
    
    public init(httpClient: RemoteAPI.AsyncHttpClient) {
        self.httpClient = httpClient
    }
    
    func loadList(request: URLRequest) async -> ([Meals], Error) {
        
           let httpResult = try? await httpClient.execute(request: request)
        
            guard let data = httpResult?.0, let response = httpResult?.1 else {
                return  ([],NSError())
            }
         
            let recipeList = try? TopRecipeListMap.map(data: data, response: response)
        
            guard let recipeList = recipeList else {
                 return  ([],NSError())
            }
            
            return (recipeList, NSError())

        
    }
    
    var httpClient: RemoteAPI.AsyncHttpClient
    
    
}
