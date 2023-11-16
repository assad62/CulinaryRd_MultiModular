//
//  HList.swift
//  CommonUI
//
//  Created by Development on 15/11/2023.
//

import SwiftUI
import SDWebImageSwiftUI

public struct HList: View {
    let url:String
    let title:String
    let subtitle:String
    
    public init(url: String, title: String, subtitle: String) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        
        VStack{
            WebImage(url: URL(string:url))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .cornerRadius(.infinity)
            
            Text(title)
        }
    }
}
