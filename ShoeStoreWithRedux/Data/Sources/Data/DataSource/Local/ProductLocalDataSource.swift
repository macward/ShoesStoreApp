//
//  File.swift
//  
//
//  Created by Max Ward on 18/11/2023.
//

import Foundation
import Domain

public struct ProductLocalDataSource {
    
    private var viewContext = PersistenceController.shared.container.viewContext
    
    func storeVieo(_ schemes: [ProductScheme]) {
        schemes.forEach { scheme in
            let product = Product(context: viewContext)
            product.id = UUID()
            product.title = scheme.title
            product.price = scheme.price
            product.image = scheme.image
            product.isFav = false
            product.isFeatured = scheme.featured
            product.isTop = scheme.top
            try? viewContext.save()
        }
    }
}
