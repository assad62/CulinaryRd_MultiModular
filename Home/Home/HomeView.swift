//
//  HomeView.swift
//  Home
//
//  Created by Development on 14/11/2023.
//

import SwiftUI
import CommonUI

public struct HomeView: View {
    let goToDetailView:(_ id:String)-> Void
    @StateObject private var vm: HomeViewModel
    
    
    public init(goToDetailView: @escaping(_ id:String )->Void, vm:HomeViewModel){
        self.goToDetailView = goToDetailView
        _vm = StateObject(wrappedValue: vm)
        
    }
    
    public var body: some View {
       
        
        VStack(alignment: .leading){
            Text("Categories").bold()
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding()
            
            
            
            
             ScrollView(.horizontal, showsIndicators: false){
                                
                                HStack(alignment: .top, spacing:8){
                                    
                                    ForEach(vm.catList) { category in
                                        
                                        HList(url: category.strCategoryThumb,
                                              title: category.strCategory,
                                              subtitle: "")
                                        
                                        
                                    }
                                    
                                    
                                }
                            }.padding(.leading)
            
            
            VStack(alignment: .leading){
                Text("Top Recipies").bold()
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.leading)
                
                
                
                List{
                    ForEach(vm.topRecipesList){ recipe in
                        
                        TopRecipeRow(recipe: recipe)
                          
                            .onTapGesture {
                                goToDetailView(recipe.strMealThumb ?? "")
                            }
                        
                       
                    }
                }
                
                
     
                }
                
                .listStyle(InsetListStyle())
              
        }.onAppear{
//            vm.loadCategories()
//            
//            Task{
//                await vm.loadTopRecipies()
//            }
          
        }
        
        
        
       
        
       
    }
    
    

               
            
            

        
       
            
    
}

