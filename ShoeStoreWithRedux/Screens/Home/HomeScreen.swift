//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import Combine
import SwiftCommonLibrary
import DataLayer
import UISharedElements
import ProductDetails

struct HomeScreen: View {
    // General app sstate manager
    @EnvironmentObject var appManager: GlobalDataManager
    
    // TabView visisbility
    @Binding var tabState: Visibility
    
    @State private var path = NavigationPath()
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    @State private var subscriptions = Set<AnyCancellable>()
    
    init(tabState: Binding<Visibility>) {
        self._tabState = tabState
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    // Main Slider
                    MainSliderView(products: appManager.featured,
                                   selectedProduct: $selectedProduct,
                                   actionOnTap: $openDetailScreen) { product in
                        SliderCardView(product: product)
                    }
                    
                    // Popular Slider
                    ProductSliderView(sectionTitle: "Popular",
                                      products: appManager.popular,
                                      selectedProduct: $selectedProduct,
                                      actionOnTap: $openDetailScreen) {
                        path.append("Popular")
                    }
                    
                    // all prods
                    ProductsGridComponent(products: $appManager.products,
                                          selectedProduct: $selectedProduct,
                                          openDetails: $openDetailScreen) {
                        path.append("Newest shoes")
                    } likeAction: { $product in
                        product.isFav.toggle()
                    }
                    .padding(.horizontal)
                }
            }
            .activityIndicatorDefault(isLoading: appManager.globalLoadingState)
            .navigationDestination(for: String.self) { textValue in
                ProductListScreen(text: textValue, path: $path)
            }
            .fullScreenCover(isPresented: $openDetailScreen, content: {
                ProductDetailScreen(product: $selectedProduct)
            })
            .task {
                await appManager.loadData()
            }
        }
    }
    
    
}
