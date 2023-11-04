//
//  GlobalAppManager.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Combine
import DataLayer

class GlobalDataManager: ObservableObject {
    
    // MARK: Public properties
    @Published var products: [Product] = []
    @Published var featured: [Product] = []
    @Published var popular: [Product] = []
    
    @Published var shoppingBasket: [Product] = []
    @Published var favourites: [Product] = []
    
    @Published var globalLoadingState = false
    
    // MARK: Private properties
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Publishers
    private var favouritesPublisher: AnyPublisher<[Product], Never> {
        $products
            .map { products in
                products.filter { product in
                    product.isFav == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    public var popularProductsPublisher: AnyPublisher<[Product], Never> {
        $products
            .map { products in
                products.filter { product in
                    product.isTop == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    public var featuredProductsPublisher: AnyPublisher<[Product], Never> {
        $products
            .map { products in
                products.filter { product in
                    product.isFeatured == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: Init
    init() {
        favouritesPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$favourites)
        
        featuredProductsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$featured)
        
        popularProductsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$popular)
    }
    
    // MARK: Methods
    public func handleFavourites(_ product: Product) {
        guard let index = products.firstIndex (where: { $0.id == product.id }) else { return }
        products[index].isFav.toggle()
    }
    
    @MainActor
    func loadData() async {
        if products.count > 0 { return }
        do {
            self.globalLoadingState = true
            let productResponse = try await Product.get()
            productResponse
                .publisher
                .collect()
                .assign(to: &$products)
            self.globalLoadingState = false
        } catch {
            // handle errors
            print("errors")
        }
    }
}

