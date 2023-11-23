//
//  File.swift
//  
//
//  Created by Max Ward on 18/11/2023.
//

import Foundation
import Domain
import CoreData
import SwiftCommonLibrary

public struct ProductLocalDataSourceDefault: ProductLocalDataSource {
    
    private var viewContext = PersistenceController.shared.container.viewContext
    public init() {}
    
    public func storeProduct(_ schemes: [ProductScheme]) async throws {
        try viewContext.performAndWait {
            schemes.forEach { scheme in
                let product = Product(context: viewContext)
                product.id = UUID()
                product.title = scheme.title
                product.price = scheme.price
                product.image = scheme.image
                product.isFav = false
                product.isFeatured = scheme.featured
                product.isTop = scheme.top
            }
            try viewContext.saveIfNeeded()
        }
        
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
