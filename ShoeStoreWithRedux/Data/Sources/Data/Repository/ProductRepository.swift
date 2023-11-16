//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import Domain

public struct ProductRepositoryDefault: ProductRepository {
    var dataSource: ProductDataSource
    
    public init(dataSource: ProductDataSource) {
        self.dataSource = dataSource
    }
    
    public func getProducts() async throws -> [Product] {
        let schemes = try await dataSource.getProducts()
        return schemes.map { Product.build(scheme: $0) }
    }
}
