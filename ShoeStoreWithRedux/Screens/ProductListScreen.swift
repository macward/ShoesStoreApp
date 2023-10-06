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
    
    var body: some View {
        ScrollView {
            ProductsGridComponent(title: "", products: $appManager.allProducts, selectedProduct: $selectedProduct) {
                openDetailScreen.toggle()
            } likeAction: { $product in
                product.isFav.toggle()
                appManager.handleFavourite(product)
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
