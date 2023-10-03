//
//  ProductsGridView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct ProductsGridView: View {
    
    private var gridItemLayout: [GridItem]
    var title: String
    var products: [Product]
    var callback: () -> Void
    
    init(title: String, products: [Product], callback: @escaping () -> Void) {
        self.gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
        self.title = title
        self.products = products
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            SectionHeaderAction(title: "Newest shoes", callback: callback)
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(products) { product in
                    ProductCardView(product: product)
                }
            }
        }
    }
}

struct ProductsGridViewTest: View {
    var body: some View {
        ProductsGridView(title: "Sample", products: []) {
            print("")
        }
    }
}

#Preview {
    ProductsGridViewTest()
}
