//
//  File.swift
//  
//
//  Created by Max Ward on 08/11/2023.
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

public class NWProductService: ProductService {
    
    private var dispatcher = Dispatcher(baseUrl: ServicesConfig.shared.baseUrl)
    public init() {}
    public func getAll() async throws -> [ProductScheme] {
        let result = try await dispatcher.execute(request: ProductEndpoint.all, 
                                                  of: [ProductScheme].self)
        return result
    }
    
}
