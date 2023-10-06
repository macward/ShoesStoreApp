//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    // General app sstate manager
    @EnvironmentObject var appManager: GlobalAppManager
    
    // TabView visisbility
    @Binding var tabState: Visibility
    
    // Mock Data
    @State private var featuredProducts: [Product] = Mock.mainSliderProducts
    @State private var popularProducts: [Product] = Mock.products
    @State private var allProducts: [Product] = Mock.products
    
    @State private var path = NavigationPath()
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    
    init(tabState: Binding<Visibility>) {
        self._tabState = tabState
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                ScrollView {
                    VStack {
                        
                        // Main Slider
                        MainSliderView(products: featuredProducts, selectedProduct: $selectedProduct) { product in
                            SliderCardView(product: product)
                        }
                        
                        // Popular Slider
                        ProductSliderView(sectionTitle: "Popular", products: popularProducts, selectedProduct: $selectedProduct) {
                            path.append("Popular")
                        }
                        
                        // all prods
                        ProductsGridComponent(title: "Newest shoes", products: $allProducts, selectedProduct: $selectedProduct) {
                            path.append("Newest shoes")
                        } likeAction: { $product in
                            appManager.handleFavourite(product)
                            product.isFav.toggle()
                        }
                        .padding(.horizontal)
                        .safeAreaPadding(.bottom, 90)
                        
                    }
                    .navigationDestination(for: String.self) { textValue in
                        ProductListScreen(text: textValue, path: $path)
                    }
                }
                .ignoresSafeArea()
                .coordinateSpace(name: "scroll")
                .onChange(of: selectedProduct) { oldValue, newValue in
                    if newValue == nil { return }
                    openDetailScreen.toggle()
                }
                .fullScreenCover(isPresented: $openDetailScreen, content: {
                    ProductDetailScreen(product: $selectedProduct)
                })
            }
        }
    }
}

#Preview {
    HomeScreen(tabState: .constant(.visible))
}
