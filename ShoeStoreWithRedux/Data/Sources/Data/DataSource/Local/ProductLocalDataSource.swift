//
//  File.swift
//  
//
//  Created by Max Ward on 18/11/2023.
//

import Foundation
import Domain
import CoreData

public protocol ProductLocalDataSource {
    func storeProduct(_ schemes: [ProductScheme]) async
}

public struct ProductLocalDataSourceDefault: ProductLocalDataSource {
    
    private var container = PersistenceController.shared.container
    public init() {}
    public func storeProduct(_ schemes: [ProductScheme]) async {
        
        schemes.forEach { scheme in
            let product = Product(context: container.viewContext)
            product.id = UUID()
            product.title = scheme.title
            product.price = scheme.price
            product.image = scheme.image
            product.isFav = false
            product.isFeatured = scheme.featured
            product.isTop = scheme.top
            try? container.viewContext.save()
        }
        
    }
    
    public func batchStore(_ schemes: [ProductScheme]) async throws {
        
    }
    
    static public func deleteAllelements() {
        let container = PersistenceController.shared.container
        let storeContainer = container.persistentStoreCoordinator
        for store in storeContainer.persistentStores {
            try? storeContainer.destroyPersistentStore(at: store.url!,
                                                      ofType: store.type,
                                                      options: nil)
        }
    }
    
    
}
