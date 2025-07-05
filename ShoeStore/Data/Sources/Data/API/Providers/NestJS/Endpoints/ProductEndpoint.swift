//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

import NetworkWrapper

enum ProductEndpoint: Request {
    
    case all
    
    var path: String {
        return "products"
    }
    
    var method: NetworkWrapper.RequestMethod {
        .get
    }
    
    var headers: NetworkWrapper.ReaquestHeaders? {
        return [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json; charset=utf-8"
        ]
    }
    
    var parameters: NetworkWrapper.RequestParameters? {
        nil
    }
}
