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
                        MainSliderView(products: appManager.featuredProducts, 
                                       selectedProduct: $selectedProduct,
                                       actionOnTap: $openDetailScreen) { product in
                            SliderCardView(product: product)
                        }
                        
                        // Popular Slider
                        ProductSliderView(sectionTitle: "Popular", 
                                          products: appManager.popularProducts,
                                          selectedProduct: $selectedProduct, 
                                          actionOnTap: $openDetailScreen) {
                            path.append("Popular")
                        }
                        
                        // all prods
                        ProductsGridComponent(products: $appManager.allProducts,
                                              selectedProduct: $selectedProduct,
                                              openDetails: $openDetailScreen) {
                            path.append("Newest shoes")
                        } likeAction: { $product in
                            product.isFav.toggle()
                        }
                        .padding(.horizontal)
                        .safeAreaPadding(.bottom, 90)
                    }
                }
                .ignoresSafeArea()
                .navigationDestination(for: String.self) { textValue in
                    ProductListScreen(text: textValue, path: $path)
                }
                .fullScreenCover(isPresented: $openDetailScreen, content: {
                    ProductDetailScreen(product: $selectedProduct)
                })
            }
            .task {
                await appManager.loadData()
            }
        }
    }
}

#Preview {
    HomeScreen(tabState: .constant(.visible))
}
