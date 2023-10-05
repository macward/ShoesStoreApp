//
//  ProductListScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ProductListScreen: View {
    
    var text: String
    @Binding var path: NavigationPath
    @State var openDetailScreen: Bool = false
    @State var selectedProduct: Product?
    
    var body: some View {
        ScrollView {
            ProductsGridView(title: "", products: Mock.products, selectedProduct: $selectedProduct) {}
                .onChange(of: selectedProduct) { oldValue, newValue in
                    if newValue == nil { return }
                    openDetailScreen.toggle()
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
