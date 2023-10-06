//
//  GlobalAppManager.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI

class GlobalAppManager: ObservableObject {
    
    @Published var favourites: [Product] = []
    @Published var shoppingBasket: [Product] = []
    
    func handleFavourite(_ product: Product) {
        
        if favourites.contains(where: { $0.id == product.id}) {
            self.removeFromFavourites(product)
        } else {
            self.addToFavourites(product)
        }
    }
    
    func addToFavourites(_ product: Product) {
        if let _ = favourites.firstIndex(where:{$0.id == product.id }) {
            return
        }
        self.favourites.append(product)
    }
    
    func removeFromFavourites(_ product: Product) {
        guard let index = favourites.firstIndex(where:{$0.id == product.id }) else { return }
        self.favourites.remove(at: index)
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

