//
//  ProductsGridView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct ProductsGridView: View {
    
    var title: String
    var products: [Product]
    @Binding var selectedProduct: Product?
    
    var callback: () -> Void
    private var gridItemLayout: [GridItem]
    
    init(title: String, products: [Product], 
         selectedProduct: Binding<Product?>, callback: @escaping (() -> Void)) {
        self.gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
        self.title = title
        self.products = products
        self._selectedProduct = selectedProduct
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            if title != "" {
                SectionHeaderAction(title: "Newest shoes", callback: callback)
            }
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(products) { product in
                    ProductCardView(product: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
            }
        }
    }
}

struct ProductsGridViewTest: View {
    var body: some View {
        ProductsGridView(title: "Sample", products: [], selectedProduct: .constant(.init(image: "nike_11"))) {
            print("")
        }
    }
}

#Preview {
    ProductsGridViewTest()
}
