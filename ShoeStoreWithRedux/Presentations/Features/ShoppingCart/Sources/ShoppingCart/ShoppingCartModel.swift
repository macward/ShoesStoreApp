//
//  File.swift
//  
//
//  Created by Max Ward on 09/11/2023.
//

import Foundation
import Combine
import Domain

public class ShoppingCartModel: ObservableObject {
    
    @Published var cart: [Order] = []
    @Published var subtotal: Double = 0
    @Published var total: Double = 0
    @Published var shippingCost: Double = 7.99
    private var subscriptions = Set<AnyCancellable>()
    
    var totalPricePublisher: AnyPublisher<Double, Never> {
        $cart
            .map { order in
                order.reduce(0) { result, order in
                    result + order.product.price
                }
            }
        .eraseToAnyPublisher()
    }
    
    var shippingPublisher: AnyPublisher<Double, Never> {
        $shippingCost
            .map{$0}
            .eraseToAnyPublisher()
    }
    
    var totalPublisher: AnyPublisher<Double, Never> {
        Publishers.CombineLatest(totalPricePublisher, shippingPublisher)
            .map { total, shipping in
                total + shipping
            }
            .eraseToAnyPublisher()
    }
    
    public init() {}
    
    public func config (cart: [Order]) {
        self.cart = cart
        totalPricePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$subtotal)
        
        totalPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$total)
    }
    
    func removeFromCart() {}
    
    func addToCart() {}
    
    func checkOut() {}
    
}
