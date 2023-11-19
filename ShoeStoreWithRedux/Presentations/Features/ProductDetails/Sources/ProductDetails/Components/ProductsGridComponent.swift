//
//  ProductsGridView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI
import Domain
import UISharedElements
import CoreData

public struct ProductsGridComponent: View {
    
    @State private var title: String = ""
    var products: FetchedResults<Product>
    @Binding var actionOnTap: Bool
    private var showAction: () -> Void
    private var likeAction: (Product) -> Void
    @Binding var selectedProduct: Product?
    
    public init(products: FetchedResults<Product>,
         selectedProduct: Binding<Product?>,
         openDetails: Binding<Bool>,
         showAction: @escaping () -> Void,
         likeAction: @escaping (Product) -> Void) {
        self.products = products
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
//            GridContainer(data: products, content: { product in
//                ProductCardView(product: product,
//                                action: likeAction)
//                .onTapGesture {
//                    selectedProduct = product
//                    actionOnTap.toggle()
//                }
//                .componentTitle(title: "Newest shoes")
//            })
        }
        .onPreferenceChange(ComponentTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
    }
}
