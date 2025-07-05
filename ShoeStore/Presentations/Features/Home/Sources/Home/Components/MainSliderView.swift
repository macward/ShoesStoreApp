//
//  MainSliderView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI
import Domain
import CoreData

public struct MainSliderView<Content: View>: View {
    
    private var products: FetchedResults<Product>
    @Binding var selectedProduct: Product?
    @Binding var actionOnTap: Bool
    @ViewBuilder var content: (Product) -> Content
    
    public init(products: FetchedResults<Product>,
         selectedProduct: Binding<Product?>,
         actionOnTap: Binding<Bool>,
         content: @escaping (Product) -> Content
    ) {
        self.products = products
        self._selectedProduct = selectedProduct
        self._actionOnTap = actionOnTap
        self.content = content
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(products) { product in
                    content(product)
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                         y: phase.isIdentity ? 1 : 0.8)
                                .offset(x: phase.isIdentity ? 0 : -30)
                        }
                        .onTapGesture {
                            selectedProduct = product
                            actionOnTap.toggle()
                        }
                }
            }
            .padding(.top)
            .contentMargins(16, for: .scrollContent)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .contentMargins(16, for: .scrollContent)
    }
}
