//
//  FavouritesScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Domain
import UISharedElements
import ModuleAdapter
import Injector

internal struct FavoritesScreen: View {
    
    @Injector(.runtime) private var adapter: ProductAdapters
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "isFav == true")
    ) var products: FetchedResults<Product>
    
    internal init() {}
    
    internal var body: some View {
        let gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
        
        NavigationStack {
            ScrollView {
                if !products.isEmpty {
                    VStack {
                        LazyVGrid(columns: gridItemLayout, spacing: 20) {
                            ForEach(products) { product in
                                ProductCardView(product: product)
                                    .onTapGesture {
                                        selectedProduct = product
                                        openDetailScreen = true
                                    }
                            }
                        }
                    }
                } else {
                    Text("No hay favoritos")
                        .font(.title2.bold())
                }
            }
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Favourites")
            .fullScreenCover(isPresented: $openDetailScreen, content: {
                adapter.openProductDetail(product: $selectedProduct)
            })
        }
    }
}
