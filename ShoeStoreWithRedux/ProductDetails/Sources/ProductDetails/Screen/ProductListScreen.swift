//
//  ProductListScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import DataLayer
import UISharedElements

public struct ProductListScreen: View {
    
    @EnvironmentObject var appManager: GlobalDataManager
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            ProductsGridComponent(products: $appManager.products,
                                  selectedProduct: $selectedProduct, 
                                  openDetails: $openDetailScreen, 
                                  showAction: {}, likeAction: { $product in
                product.isFav = true
            })
            .preference(key: ComponentTitlePreferenceKey.self, value: "")
//            .fullScreenCover(isPresented: $openDetailScreen, content: {
//                ProductDetailScreen(product: selectedProduct)
//            })
        }
        .contentMargins(16, for: .scrollContent)
        .navigationTitle("Products")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    // coordinator delete
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
}

