//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

public protocol GetProductsUseCase {
    func call() async throws -> [Product]
}

public struct GetProductsUseCaseDefault: GetProductsUseCase {
    
    var repository: any ProductRepository
    
    public init(repo: any ProductRepository) {
        self.repository = repo
    }
    
    public func call() async throws -> [Product] {
        try await repository.getProducts()
    }
}
