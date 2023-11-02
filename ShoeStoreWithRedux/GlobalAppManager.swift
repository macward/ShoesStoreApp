//
//  GlobalAppManager.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Combine

class GlobalAppManager: ObservableObject {
    
    @Published var featuredProducts: [Product] = []
    @Published var popularProducts: [Product] = []
    @Published var allProducts: [Product] = []
    
    @Published var favArray: [String] = []
    @Published var shoppingBasket: [Product] = []
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var globalLoadingState = false
    @Published var favourites: [Product] = []
    
    init() {
        allProducts
            .publisher
            .receive(on: DispatchQueue.main)
            .sink { prods in
                print(prods)
            }
            .store(in: &subscriptions)
    }
    
    func favSubscriber() {
        allProducts
            .publisher
            .receive(on: DispatchQueue.main)
            .filter{$0.isFav == true }
            .append()
            .sink(receiveValue: { values in
                print(values)
                print("---")
            })
            .store(in: &subscriptions)
    }
    
    func favouritesCombine() -> AnyPublisher<Product, Never> {
        return allProducts
                .publisher
                .receive(on: DispatchQueue.main)
                .filter{$0.isFav == true}
                .append()
                .eraseToAnyPublisher()
    }
    
    @MainActor
    func loadData() async {
        if allProducts.count > 0 { return }
        self.globalLoadingState = true
        let products = await Product.get("http://127.0.0.1:3000/products/home")
        
        self.allProducts = products.map({self.buildfavorite($0)})
        self.featuredProducts = products.filter({$0.isFeatured == true})
        self.popularProducts = products.filter({$0.isTop == true})
        self.globalLoadingState = false
    }
    
    func buildfavorite(_ product: Product) -> Product {
        var isFav: Bool = false
        if favArray.contains(product.id) {
            isFav = true
        }
        return Product(id: product.id, image: product.image, isFav: isFav)
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

