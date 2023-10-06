//
//  GlobalAppManager.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI

class GlobalAppManager: ObservableObject {
    
    @Published var featuredProducts: [Product] = Mock.mainSliderProducts
    @Published var popularProducts: [Product] = Mock.products
    @Published var allProducts: [Product] = Mock.products
    
    @Published var shoppingBasket: [Product] = []
    
    func favourites() -> [Product] {
        return allProducts.filter { product in
            product.isFav == true
        }
    }
    
    func isInFavourites(_ product: Product) -> Bool {
        if let _ = shoppingBasket.firstIndex(where:{$0.id == product.id }) {
            return true
        }
        return false
    }
    
    func addTobasket(_ product: Product) {
        if let _ = shoppingBasket.firstIndex(where:{$0.id == product.id }) {
            return
        }
        shoppingBasket.append(product)
    }
    
    func removeFromBasket(_ product: Product) {
        guard let index = shoppingBasket.firstIndex(where:{$0.id == product.id }) else { return }
        shoppingBasket.remove(at: index)
    }
    
    func isInBasket(_ product: Product) -> Bool {
        if let _ = shoppingBasket.firstIndex(where:{$0.id == product.id }) {
            return true
        }
        return false
    }
    
}

