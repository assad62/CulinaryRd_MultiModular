//
//  VList.swift
//  CommonUI
//
//  Created by Development on 15/11/2023.
//

import SwiftUI
import SDWebImageSwiftUI

public struct VList: View {
    let url:String
    let title:String
    let subtitle:String
    
    public init(url: String, title: String, subtitle: String) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        HStack{
            WebImage(url: URL(string:url))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .background(Color.orange)
                .cornerRadius(.infinity)
            
            VStack(alignment: .leading){
             
                Text(title)
                    .font(.system(size: 21, weight: .bold))
               
                if(!subtitle.isEmpty){
                    Text("\(subtitle )").font(.footnote)
                }
               
   
               
            }
        }
    }
}


