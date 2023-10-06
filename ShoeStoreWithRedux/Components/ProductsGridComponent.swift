//
//  ProductsGridView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct ProductsGridComponent: View {
    
    private var title: String
    @Binding var products: [Product]
    private var showAction: () -> Void
    private var likeAction: (Binding<Product>) -> Void
    @Binding var selectedProduct: Product?
    
    init(title: String, 
         products: Binding<[Product]>,
         selectedProduct: Binding<Product?>,
         showAction: @escaping (() -> Void),
         likeAction: @escaping ((Binding<Product>) -> Void)) {
        self.title = title
        self._products = products
        self._selectedProduct = selectedProduct
        self.showAction = showAction
        self.likeAction = likeAction
    }
    
    var body: some View {
        VStack {
            if title != "" {
                SectionHeaderAction(title: "Newest shoes", callback: showAction)
            }
            ProductGridContainer(data: $products, content: { $product in
                ProductCardView(product: $product, action: likeAction)
                .onTapGesture {
                    selectedProduct = product
                }
            })
        }
    }
}

struct ProductGridContainer<Content: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    
    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    
    var body: some View {
        let gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
        
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach($data) { $item in
                content($item)
            }
        }
    }
}

struct ProductsGridViewTest: View {
    var body: some View {
        ProductsGridComponent(title: "Sample", products: .constant([]), selectedProduct: .constant(.init(image: "nike_11"))) {
            print("like callback")
        } likeAction: { _ in
            
        }
    }
}

#Preview {
    ProductsGridViewTest()
}
