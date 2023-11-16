//
//  HomeViewModel.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation
import Combine
import SwiftUI
import RemoteAPI

public class HomeViewModel:ObservableObject {
    var cancellable = Set<AnyCancellable>()
    var catService:CatListService
    var topRecipeListService:TopRecpiesListService
    
    @Published var topRecipesList:[Meals] = []
    @Published var catList:[Category] = []
     
    public init(cancellable: Set<AnyCancellable> = Set<AnyCancellable>(),
             catService: CatListService = CatListService(httpClient: URLSession.shared),
             topRecipeListService:TopRecpiesListService = TopRecpiesListService(httpClient: URLSession.shared),
             catList: [Category] = [],
             topRecipesList:[Meals] = []
                
    
    ) {
        self.cancellable = cancellable
        self.catService = catService
        self.catList = catList
        self.topRecipeListService = topRecipeListService
        
        loadCategories()
        
        Task{
            await loadTopRecipies()
        }
        
    }

    
    
    //FOR PRACTICE ONLY: Calling topRecipieList using async await
    func loadTopRecipies() async{
        let urlRequest = URLRequest(url: URL(string:"https://www.themealdb.com/api/json/v1/1/random.php")!)
        
        
        for _ in 0...10 {
            let list = await topRecipeListService.loadList(request: urlRequest)
            
            DispatchQueue.main.async {
                self.topRecipesList.append(contentsOf: list.0)
            }
        }
        
        
        
    }
    
    
    
      func loadCategories(){
       
            let urlRequest = URLRequest(url: URL(string:"https://www.themealdb.com/api/json/v1/1/categories.php")!)
            
            
             catService
                .loadList(request: urlRequest)
                .receive(on: DispatchQueue.main)
                .sink { completion in
                } receiveValue: { [unowned self] listData in
                   
                    self.catList.append(contentsOf: listData)
                }
                .store(in: &cancellable)
        }
}
