//
//  Products+CoreDataProperties.swift
//  Shoe Store
//
//  Created by Max Ward on 18/11/2023.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var image: String?
    @NSManaged public var isFav: Bool
    @NSManaged public var isFeatured: Bool
    @NSManaged public var isTop: Bool
    @NSManaged public var id: UUID?

}

extension Products : Identifiable {

}
