//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 23/11/2023.
//

import SwiftUI
import Domain

public struct ShoppingEmptyScreen: View {
    
    @FetchRequest(
        sortDescriptors: []
    ) var orders: FetchedResults<Order>
    
    public init() {}
    public var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(orders) { order in
                    VStack {
                        Text(order.product.title)
                    }
                }
            }
        }
    }
}
