//
//  Product.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import Foundation

// a model must conform Equatable for optional binding
// a model must confotm Identifiable to work woith ForEach (Factory)

struct Product: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var image: String
}
