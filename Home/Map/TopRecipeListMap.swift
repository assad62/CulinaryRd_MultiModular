//
//  TopRecipeListMap.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation

struct TopRecipeListMap {
    static func map(data:Data, response:HTTPURLResponse) throws -> [Meals]{
        let decoder = JSONDecoder()
        
        if response.statusCode == 200 {
            
           
            do {
                let result = try decoder.decode(MealListDTO.self, from: data)
                
                return result.meals
            }
            catch {
                
            }
        }
        
        return []
    }
}
