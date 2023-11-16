//
//  TopRecipeRow.swift
//  Home
//
//  Created by Development on 16/11/2023.
//

import Foundation
import SwiftUI
import CommonUI

struct TopRecipeRow:  View {
    let recipe:Meals
    
    var body: some View {
        HStack{
            VList(url: recipe.strMealThumb ?? "",
                  title: recipe.strMeal ?? "",
                  subtitle: recipe.strCategory ?? "")
            Spacer()
            Image(systemName: "chevron.right")
        }
        .contentShape(Rectangle())
    }
}
