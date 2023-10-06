//
//  ProductListScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ProductListScreen: View {
    
    @EnvironmentObject var appManager: GlobalAppManager
    
    var text: String
    @Binding var path: NavigationPath
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    @State private var products: [Product] = Mock.products
    
    var body: some View {
        ScrollView {
            ProductsGridComponent(title: "", products: $products, selectedProduct: $selectedProduct) {
                openDetailScreen.toggle()
            } likeAction: { $product in
                appManager.handleFavourite(product)
                product.isFav.toggle()
            }
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
