//
//  APISchemes.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/11/2023.
//

import Foundation

struct ProductsScheme: Codable {
    var products: [ProductScheme]
}

struct ProductScheme: Codable {
    var id: Int
    var title: String
    var description: String?
    var price: Double
    var image: String
    var available: Bool
    var featured: Bool
    var top: Bool
}