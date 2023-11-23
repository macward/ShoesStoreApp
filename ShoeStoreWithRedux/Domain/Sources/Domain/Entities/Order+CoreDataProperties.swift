//
//  Order+CoreDataProperties.swift
//  Shoe Store
//
//  Created by Max Ward on 23/11/2023.
//
//

import Foundation
import CoreData

extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var id: UUID
    @NSManaged public var quantity: Int16
    @NSManaged public var product: Product

}

extension Order : Identifiable {

}
