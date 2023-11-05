//
//  ProductListScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import DataLayer
import ProductDetails

struct ProductListScreen: View {
    
    @EnvironmentObject var appManager: GlobalDataManager
    
    var text: String
    @Binding var path: NavigationPath
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    
    var body: some View {
        ScrollView {
            ProductsGridComponent(products: $appManager.products,
                                  selectedProduct: $selectedProduct, 
                                  openDetails: $openDetailScreen, 
                                  showAction: {}, likeAction: { $product in
                product.isFav = true
            })
            .preference(key: ComponentTitlePreferenceKey.self, value: "")
            .fullScreenCover(isPresented: $openDetailScreen, content: {
                ProductDetailScreen(product: $selectedProduct)
            })
        }
        .contentMargins(16, for: .scrollContent)
        .navigationTitle(text)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    path.removeLast()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
}


