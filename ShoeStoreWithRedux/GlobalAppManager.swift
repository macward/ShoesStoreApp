//
//  GlobalAppManager.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Combine

class GlobalAppManager: ObservableObject {
    
    @Published var allProducts: [Product] = []
    @Published var popularProducts: [Product] = []
    @Published var featuredProducts: [Product] = []
    
    @Published var shoppingBasket: [Product] = []
    @Published var favourites: [Product] = []
    
    @Published var globalLoadingState = false
    
    private var favouritesPublisher: AnyPublisher<[Product], Never> {
        $allProducts
            .map { products in
                products.filter { product in
                    product.isFav == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        favouritesPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$favourites)
    }
    
    @MainActor
    func loadData() async {
        if allProducts.count > 0 { return }
        
        self.globalLoadingState = true
        let productResponse = await Product.get("http://127.0.0.1:3000/products/home")
        
        productResponse
            .publisher
            .collect()
            .assign(to: &$allProducts)
        
        productResponse
            .publisher
            .filter { product in
                product.isFeatured == true
            }
            .collect()
            .assign(to: &$featuredProducts)
        
        productResponse
            .publisher
            .filter { product in
                product.isTop == true
            }
            .collect()
            .assign(to: &$popularProducts)
        
        self.globalLoadingState = false
    }    
}

