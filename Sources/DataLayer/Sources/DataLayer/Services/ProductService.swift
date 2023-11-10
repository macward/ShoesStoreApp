//
//  ProductService.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/11/2023.
//

import Foundation
import Services

public extension Product {
    static func build(scheme: ProductScheme) -> Product {
        Product(title: scheme.title,
                price: scheme.price,
                image: scheme.image,
                isFeatured: scheme.featured,
                isTop: scheme.top)
    }
}
