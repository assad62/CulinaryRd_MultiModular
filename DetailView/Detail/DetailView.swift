//
//  DetailView.swift
//  DetailView
//
//  Created by Development on 14/11/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import CommonUI
import SwiftUIIntrospect





public struct DetailView: View {
    
    @State var url:String
    @State var navTintColor:Color
    
    
    public init(url: String = "",navTintColor:Color) {
        self.url = url
        self.navTintColor = navTintColor
        
    }
    
    public var body: some View {
        
        
        ScrollView {
            ParallaxHeader(
                coordinateSpace: CoordinateSpaces.scrollView,
                defaultHeight: 400
            ) {
                WebImage(url: URL(string:url))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                
                
            }
            Rectangle()
                .fill(.blue)
                .frame(height: 1000)
                .shadow(color: .black.opacity(0.8), radius: 10, y: -10)
                .offset(y: -10)
        }
        .navigationTitle("Details")
        .coordinateSpace(name: CoordinateSpaces.scrollView)
        .introspect(.navigationView(style: .stack), on: .iOS(.v13, .v14, .v15, .v16, .v17), scope: .ancestor) { navBar in
            
            navBar.navigationBar.tintColor = Color.convert(navTintColor)
            
        }
        
        
    }
    
}


