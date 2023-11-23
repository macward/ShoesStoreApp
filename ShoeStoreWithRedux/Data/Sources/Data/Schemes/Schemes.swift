//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

public struct ProductsScheme: Codable {
    public var products: [ProductScheme]
}

public struct ProductScheme: Codable {
    public var id: Int
    public var title: String
    public var description: String?
    public var price: Double
    public var image: String
    public var available: Bool
    public var featured: Bool
    public var top: Bool
}
