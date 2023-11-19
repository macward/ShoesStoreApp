//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

public struct ProductsAPIDataSourceDefault: ProductDataSource {
    
    private var service = NWProductService()
    
    public init() {}
    
    public func getProducts() async throws -> [ProductScheme] {
        let schemes = try await service.getAll()
        return schemes
    }
    
    
}
