//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import Injector

public struct ProductsAPIDataSourceDefault: ProductDataSource {
    
    @Injector(.runtime) private var service: ProductApiService
    
    public init() {}
    
    public func getProducts() async throws -> [ProductScheme] {
        let schemes = try await service.getAll()
        return schemes
    }
    
    
}
