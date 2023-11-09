//
//  File.swift
//  
//
//  Created by Max Ward on 04/11/2023.
//

import Foundation
import StoreNetwork

public protocol ProductService {
    func getAll() async throws -> [ProductScheme]
}

public class ProductServiceDefault: ProductService {
    
    public init() {}
    
    private var productsUrl: URL {
        URL(string: "\(ServicesConfig.shared.baseUrl)products")!
    }
    
    public func getAll() async throws -> [ProductScheme] {
        do {
            let data = try await API.get(.init(url: productsUrl), of: [ProductScheme].self)
            return data
        } catch (let error) {
            // handle error
            print(error.localizedDescription)
            return []
        }
    }
}
