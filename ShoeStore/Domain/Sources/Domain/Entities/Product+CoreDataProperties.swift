//
//  Product+CoreDataProperties.swift
//  Shoe Store
//
//  Created by Max Ward on 24/11/2023.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: String
    @NSManaged public var isFav: Bool
    @NSManaged public var isFeatured: Bool
    @NSManaged public var isTop: Bool
    @NSManaged public var price: Double
    @NSManaged public var title: String?
    @NSManaged public var toOrder: Order?

}

extension Product : Identifiable {}

extension Product {
    public var imageUrl: URL {
        return URL(string: "\(BASE_URL)\(String(describing: image))")!
    }
}
