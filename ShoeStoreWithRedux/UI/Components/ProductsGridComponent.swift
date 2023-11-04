//
//  ProductsGridView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct ProductsGridComponent: View {
    
    @State private var title: String = ""
    @Binding var products: [Product]
    @Binding var actionOnTap: Bool
    private var showAction: () -> Void
    private var likeAction: (Binding<Product>) -> Void
    @Binding var selectedProduct: Product?
    
    init(products: Binding<[Product]>,
         selectedProduct: Binding<Product?>,
         openDetails: Binding<Bool>,
         showAction: @escaping () -> Void,
         likeAction: @escaping (Binding<Product>) -> Void) {
        self._products = products
        self._selectedProduct = selectedProduct
        self.showAction = showAction
        self.likeAction = likeAction
        self._actionOnTap = openDetails
    }
    
    var body: some View {
        VStack {
            if title != "" {
                SectionHeaderAction(title: title, callback: showAction)
            }
            ProductGridContainer(data: $products, content: { $product in
                ProductCardView(product: $product, 
                                action: likeAction)
                .onTapGesture {
                    selectedProduct = product
                    actionOnTap.toggle()
                }
                .componentTitle(title: "Newest shoes")
            })
        }
        .onPreferenceChange(ComponentTitlePreferenceKey.self, perform: { value in
            print(value)
            self.title = value
        })
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
        ProductsGridComponent(products: .constant([]), 
                              selectedProduct: .constant(Product.mock),
                              openDetails: .constant(false)) {
            print("like callback")
        } likeAction: { product in
            // do something
        }
    }
}

#Preview {
    ProductsGridViewTest()
}
