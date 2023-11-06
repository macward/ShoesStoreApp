//
//  ProductsGridView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI
import DataLayer

public struct ProductsGridComponent: View {
    
    @State private var title: String = ""
    @Binding var products: [Product]
    @Binding var actionOnTap: Bool
    private var showAction: () -> Void
    private var likeAction: (Binding<Product>) -> Void
    @Binding var selectedProduct: Product?
    
    public init(products: Binding<[Product]>,
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
    
    public var body: some View {
        VStack {
            if title != "" {
                SectionHeaderAction(title: title, callback: showAction)
            }
            GridContainer(data: $products, content: { $product in
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
