//
//  ProductService.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/11/2023.
//

import Foundation
import Core

extension Product {
    static func build(scheme: ProductScheme) -> Product {
        Product(title: scheme.title,
                price: scheme.price,
                image: scheme.image,
                isFeatured: scheme.featured,
                isTop: scheme.top)
    }
}

extension Product: ProductRepository {
    static func get() async throws -> [Product] {
        do {
            let data = try await API.get("\(BASE_URL)products/home", of: ProductsScheme.self)
            let products = data.products.map { Product.build(scheme: $0) }
            return products
        } catch (let error) {
            // handle error
            print(error.localizedDescription)
            return []
        }
    }
}
