//
//  File.swift
//  
//
//  Created by Max Ward on 14/11/2023.
//

import SwiftUI
import Router
import Home
import ProductDetails
import ShoppingCart

extension Route: Factory {
    @ViewBuilder
    public func contentView() -> some View {
        switch self {
        case .home:
            HomeScreen()
        case .favourites:
            FavouritesScreen()
        case .productList(let title):
            ProductListScreen(title: title)
        case .productDetail(let product):
            ProductDetailScreen(product: product)
        case .shoppingCart:
            ShoppingCartScreen()
        case .settings:
            EmptyView()
        }
    }
}
