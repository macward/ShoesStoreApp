//
//  File.swift
//  
//
//  Created by Max Ward on 15/11/2023.
//

import SwiftUI
import ModuleAdapter
import Domain

public struct ProductAdapterDefault: ProductAdapters {
    
    public typealias Output = AnyView
    
    public init() {}
    
    public func productList(title: String, path: Binding<NavigationPath>) -> AnyView {
        AnyView(ProductListScreen(title: title, path: path))
    }
    
    public func openProductDetail(product: Binding<Product?>) -> AnyView {
        AnyView(ProductDetailScreen(product: product))
    }
    
    public func favoriteScreen() -> AnyView {
        AnyView(FavoritesScreen())
    }
}
