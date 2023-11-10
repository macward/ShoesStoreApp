//
//  File.swift
//  
//
//  Created by Max Ward on 07/11/2023.
//

import Foundation
import Services
import SwiftCommonLibrary

public class ProductRepositoryDefault: ProductRepository {
    
    private var service: ProductService = NWProductService()
    
    public init() {}
    
    public func getAll() async throws -> [Product] {
        do {
            return try await service.getAll().map { Product.build(scheme: $0) }
        } catch (let error) {
            throw error
        }
    }
}
