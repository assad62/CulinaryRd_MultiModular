//
//  HomeService.swift
//  Home
//
//  Created by Development on 15/11/2023.
//

import Foundation
import Combine
import RemoteAPI

protocol CombineAPISerivce {
    var httpClient:CombineHttpClient {get set}
}


protocol AsyncAPIService{
    var httpClient:AsyncHttpClient {get set}
}
