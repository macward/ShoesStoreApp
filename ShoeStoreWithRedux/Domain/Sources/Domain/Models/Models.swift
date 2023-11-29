//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import SwiftUI

let BASE_URL = "http://localhost:3000/"

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
