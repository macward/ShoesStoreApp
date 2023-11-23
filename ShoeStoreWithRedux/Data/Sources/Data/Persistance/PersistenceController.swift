//
//  File.swift
//  
//
//  Created by Max Ward on 18/11/2023.
//

import Foundation
import CoreData

public struct PersistenceController {
    
    public static let shared = PersistenceController()
    
    public let container: NSPersistentContainer = NSPersistentContainer(name: "Database")

    public init(inMemory: Bool = false) {
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
