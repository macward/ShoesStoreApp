//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

import SwiftUI
import Combine

public class GlobalDataManager: ObservableObject {
    
    // MARK: Public properties
    @Published public var products: [Product] = []
    @Published public var featured: [Product] = []
    @Published public var popular: [Product] = []
    @Published public var favourites: [Product] = []
    @Published public var shopingCart: [Order] = []
    @Published public var globalLoadingState = false
    
    private var getProductsUseCase: any GetProductsUseCase
    
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
    public init(getProductsUseCase: any GetProductsUseCase) {
    
        self.getProductsUseCase = getProductsUseCase
    
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
    public func loadData() async {
        do {
            self.globalLoadingState = true
            defer {
                self.globalLoadingState = false
            }
            try await getProductsUseCase.call()
        } catch {
            // handle errors
            print("errors")
        }
    }
}

