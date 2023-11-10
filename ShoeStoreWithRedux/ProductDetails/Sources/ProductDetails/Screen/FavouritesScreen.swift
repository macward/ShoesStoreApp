//
//  FavouritesScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import DataLayer
import UISharedElements

public struct FavouritesScreen: View {
    
    @EnvironmentObject var appManager: GlobalDataManager
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    private var text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                if appManager.favourites.count > 0 {
                    GridContainer(data: $appManager.favourites, content: { $product in
                        ProductCardView(product: $product, action: { product in
                            appManager.handleFavourites(product.wrappedValue)
                        })
                        .onTapGesture {
                            selectedProduct = product
                            openDetailScreen.toggle()
                        }
                    })
                    .fullScreenCover(isPresented: $openDetailScreen, content: {
                        ProductDetailScreen(product: $selectedProduct)
                    })
                } else {
                    Text("No hay favoritos")
                        .font(.title2.bold())
                }
            }
            .contentMargins(16, for: .scrollContent)
            .navigationTitle(text)
        }
    }
}
