//
//  ContentView.swift
//  CulinaryRd
//
//  Created by Development on 14/11/2023.
//

import SwiftUI
import UIPilot
import Home
import Search
import Favourites
import Detail
import SwiftUIIntrospect




// Add UIPilotHost and map views with routes. That's it, you're ready to go.
struct ContentView: View {
    
    @StateObject var pilot:UIPilot<AppRoute>
    
    
    
    
    var body: some View {
       
            TabView{
                
                HomeView(goToDetailView: goToDetailView, vm: HomeViewModel())
                    .accentColor(.primary)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                   

                
                SearchView()
                    .accentColor(.primary)
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                FavView()
                    .accentColor(.primary)
                    .tabItem {
                        Label("Favourites", systemImage: "star.fill")
                    }
                
                
            }
            .navigationTitle("Culinary Road")
//            .introspect(.navigationView(style: .stack), on: .iOS(.v13, .v14, .v15, .v16, .v17), scope: .ancestor) { abBar in
//                
//                abBar.navigationBar.prefersLargeTitles = true
//                abBar.navigationBar.isTranslucent = false
//            }
//            .navigationBarTitleDisplayMode(.large)
        
       
        //
        
        
        
        
        
    }
}

extension ContentView {
    
    func goToDetailView(recipeUrl:String){
        pilot.push(AppRoute.DetailView(url: recipeUrl))
    }
}



