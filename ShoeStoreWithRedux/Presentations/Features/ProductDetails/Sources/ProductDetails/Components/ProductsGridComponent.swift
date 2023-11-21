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
    @Binding var actionOnTap: Bool
    private var showAction: () -> Void
    @Binding var selectedProduct: Product?
    
    @FetchRequest(sortDescriptors: [])
    var products: FetchedResults<Product>
    
    public init(
        selectedProduct: Binding<Product?>,
         openDetails: Binding<Bool>,
         showAction: @escaping () -> Void){
        self._selectedProduct = selectedProduct
        self.showAction = showAction
        self._actionOnTap = openDetails
    }
    
    public var body: some View {
        let gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
        
        VStack {
            if title != "" {
                SectionHeaderAction(title: title, callback: showAction)
            }
            
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(products) { product in
                    ProductCardView(product: product)
                    .onTapGesture {
                        selectedProduct = product
                        actionOnTap.toggle()
                    }
                    .componentTitle(title: "Newest shoes")
                    .onPreferenceChange(ComponentTitlePreferenceKey.self, perform: { value in
                        self.title = value
                    })
                }
            }
        }
        
    }
}
