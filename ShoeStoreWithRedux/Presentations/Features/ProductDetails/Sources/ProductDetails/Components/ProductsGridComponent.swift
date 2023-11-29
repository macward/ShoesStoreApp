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
import ModuleAdapter
import Injector

public struct ProductsGridComponent: View {
    
    @Injector(.runtime) private var adapter: ProductAdapters
    @State private var openDetailScreen: Bool = false
    @State private var title: String = ""
    @Binding var path: NavigationPath
    @State private var selectedProduct: Product?
    
    @FetchRequest(sortDescriptors: [])
    var products: FetchedResults<Product>
    
    public init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    public var body: some View {
        let gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
        VStack {
            if title != "" {
                SectionHeaderAction(title: title, callback: {
                    path.append("New shoes")
                })
            }
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(products) { product in
                    ProductCardView(product: product)
                    .onTapGesture {
                        selectedProduct = product
                        openDetailScreen = true
                    }
                    .componentTitle(title: "Newest shoes")
                    .onPreferenceChange(ComponentTitlePreferenceKey.self, perform: { value in
                        self.title = value
                    })
                }
            }
        }
        .fullScreenCover(isPresented: $openDetailScreen, content: {
            adapter.openProductDetail(product: $selectedProduct)
        })
    }
}
