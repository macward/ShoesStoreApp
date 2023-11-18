//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import Domain

struct ContentMapper {
    static func toModel(from content: ProductScheme) -> Product {
        return Product(title: content.title,
                       price: content.price,
                       image: content.image,
                       isFeatured: content.featured,
                       isTop: content.top)
    }
}

public extension Product {
    static func build(scheme: ProductScheme) -> Product {
        Product(title: scheme.title,
                price: scheme.price,
                image: scheme.image,
                isFeatured: scheme.featured,
                isTop: scheme.top)
    }
}


