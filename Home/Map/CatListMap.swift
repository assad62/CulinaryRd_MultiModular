//
//  CatListMap.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation

struct CatListMap {
    
    static func map(data:Data, response:HTTPURLResponse) throws -> [Category]{
        let decoder = JSONDecoder()
        
        if response.statusCode == 200 {
            
         //   print(data.printJson())
            do {
                let result = try decoder.decode(CategoriesDTO.self, from: data)
                
                return result.categories
            }
            catch {
                
            }
        }
        
        return []
    }
}
