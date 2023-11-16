//
//  DishCatDTO.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation


struct CategoriesDTO: Codable {
    let categories: [Category]
}

// MARK: - Category
public struct Category: Codable, Equatable, Identifiable {
    public var id: String {
        idCategory
    }
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}


