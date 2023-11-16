//
//  CulinaryRdApp.swift
//  CulinaryRd
//
//  Created by Development on 14/11/2023.
//

import SwiftUI
import UIPilot
import Detail


enum AppRoute: Equatable {
    case ParentView
    case DetailView (url:String)
    case DetailListView
}


@main
struct CulinaryRdApp: App {
    @StateObject var pilot = UIPilot(initial: AppRoute.ParentView)
    
    
    var body: some Scene {
        
        WindowGroup{
            UIPilotHost(pilot)  { route in
                switch route {
               
                case .DetailView (let url):
                    DetailView(url: url, navTintColor: .primary)
                        
                    
                    default: 
                      ContentView(pilot: pilot)
                        .accentColor(.primary)
                        .navigationBarTitleDisplayMode(.large)
                    
                }
            }
            
           // .edgesIgnoringSafeArea([.top, .bottom])

            .ignoresSafeArea(.all, edges: .all)
               
        }
        
        
        
        
    }
}
