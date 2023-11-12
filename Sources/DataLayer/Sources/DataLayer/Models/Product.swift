//
//  Product.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import Foundation
import SwiftUI
// a model must conform Equatable for optional binding
// a model must confotm Identifiable to work woith ForEach (Factory)

public struct Order: Identifiable, Equatable {
    public var id: String = UUID().uuidString
    public var product: Product
    public var number: Int
    
    public init(product: Product, number: Int) {
        self.product = product
        self.number = number
    }
}

public struct Product: Identifiable, Equatable, Hashable {
    public var id: String = UUID().uuidString
    public var title: String
    public var price: Double
    public var image: String
    public var isFav: Bool = false
    public var isFeatured: Bool = false
    public var isTop: Bool = false
    public var imageUrl: URL {
        return URL(string: "\(BASE_URL)\(image).png")!
    }
}

public struct ColorControlItem: Identifiable {
    public var id: String = UUID().uuidString
    public var name: String
    public var color: Color
    
    public init(name: String, color: Color) {
        self.name = name
        self.color = color
    }
}

public struct SizeControlItem: Identifiable {
    public var id: String = UUID().uuidString
    public var size: Int
    public var available: Bool
    
    public init(size: Int, available: Bool) {
        self.size = size
        self.available = available
    }
}

public struct CartItem: Identifiable {
    public var id: String = UUID().uuidString
    public var product: Product
    public var size: ColorControlItem
    public var color: SizeControlItem
    
    public init(product: Product, size: ColorControlItem, color: SizeControlItem) {
        self.product = product
        self.size = size
        self.color = color
    }
}

