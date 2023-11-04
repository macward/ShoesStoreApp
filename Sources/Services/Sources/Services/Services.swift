//
//  File.swift
//  
//
//  Created by Max Ward on 04/11/2023.
//

import Foundation
import StoreNetwork

public class ProductService {
    public static func get(url: URL) async throws -> [ProductScheme] {
        do {
            let data = try await API.get(url, of: ProductsScheme.self)
            return data.products
        } catch (let error) {
            // handle error
            print(error.localizedDescription)
            return []
        }
    }

}
