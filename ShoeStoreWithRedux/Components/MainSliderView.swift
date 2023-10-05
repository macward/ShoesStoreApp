//
//  MainSliderView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct MainSliderView<Content: View>: View {
    
    var products: [Product]
    @Binding var selectedProduct: Product?
    @ViewBuilder var content: (Product) -> Content
    
    var body: some View {
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
