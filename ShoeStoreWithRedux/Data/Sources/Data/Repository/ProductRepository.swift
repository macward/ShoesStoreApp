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
    private var localStorage = ProductLocalDataSource()
    public init(dataSource: ProductDataSource) {
        self.dataSource = dataSource
    }
    
    public func getProducts() async throws {
        let schemes = try await dataSource.getProducts()
        await localStorage.storeVieo(schemes)
    }
}
