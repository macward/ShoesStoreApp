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

struct Product: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var image: String
    var isFav: Bool = false
    var isFeatured: Bool = false
    var isTop: Bool = false
}

struct ColorControlItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var color: Color
}

struct SizeControlItem: Identifiable {
    var id: String = UUID().uuidString
    var size: Int
    var available: Bool
}

struct CartItem: Identifiable {
    var id: String = UUID().uuidString
    var product: Product
    var size: ColorControlItem
    var color: SizeControlItem
}
