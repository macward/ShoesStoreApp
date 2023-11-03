//
//  FavouritesScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Combine

struct FavouritesScreen: View {
    
    @EnvironmentObject var appManager: GlobalDataManager
    @State private var subscriptions = Set<AnyCancellable>()
    var text: String
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if appManager.favourites.count > 0 {
                    ProductGridContainer(data: $appManager.favourites, content: { $product in
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
