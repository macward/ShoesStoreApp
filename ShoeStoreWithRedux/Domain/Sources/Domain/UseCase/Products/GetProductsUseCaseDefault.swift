//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import Injector

public protocol GetProductsUseCase {
    func call() async throws
}

public struct GetProductsUseCaseDefault: GetProductsUseCase {
    
    @Injector(.runtime) var repository: ProductRepository
    
    public init() {}
    
    public func call() async throws {
        try await repository.getProducts()
    }
}
