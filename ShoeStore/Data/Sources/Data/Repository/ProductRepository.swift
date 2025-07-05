//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import Domain
import Injector

public struct ProductRepositoryDefault: ProductRepository {
    
    @Injector(.runtime) private var dataSource: ProductDataSource
    @Injector(.runtime) private var localStorage: ProductLocalDataSource
    
    public init() {}
    
    public func getProducts() async throws {
        let schemes = try await dataSource.getProducts()
        try? await localStorage.storeProduct(schemes)
    }
}
