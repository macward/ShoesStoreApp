//
//  FavouritesScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Combine

struct FavouritesScreen: View {
    
    @EnvironmentObject var appManager: GlobalAppManager
    @State private var subscriptions = Set<AnyCancellable>()
    var text: String
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    
    @State var favourites: [Product] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if favourites.count > 0 {
                    ProductGridContainer(data: $favourites, content: { $product in
                        ProductCardView(product: $product, action: { product in
                            let index = appManager.allProducts.firstIndex { prod in
                                prod.id == product.id
                            }
                            appManager.allProducts[index!].isFav.toggle()
                            updateUI()
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
            .onAppear() {
                updateUI()
            }
        }
    }
    
    func updateUI() {
        appManager.favouritesCombine()
            .receive(on: DispatchQueue.main)
            .collect()
            .sink { values in
                self.favourites = values
            }
            .store(in: &subscriptions)
    }
}
