//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import SwiftCommonLibrary
import DataLayer
import UISharedElements
import Router

public struct HomeScreen: View {
    @EnvironmentObject var appManager: GlobalDataManager
    
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack {
                // Main Slider
                MainSliderView(
                    products: appManager.featured,
                    selectedProduct: $selectedProduct,
                    actionOnTap: $openDetailScreen
                ) { product in
                    SliderCardView(product: product)
                }
                
                // Popular Slider
                ProductSliderView(
                    sectionTitle: "Popular",
                    products: appManager.popular,
                    selectedProduct: $selectedProduct,
                    actionOnTap: $openDetailScreen
                ) {
                    // navigation action
//                        path.append("Popular shoes")
                    coordinator.push(.productList("Popular shoes"))
                }
                
                // all prods
                ProductsGridComponent(
                    products: $appManager.products,
                    selectedProduct: $selectedProduct,
                    openDetails: $openDetailScreen
                ) {
                    // navigation action
                    // path.append("New Shoes")
                    coordinator.push(.productList("New Shoes"))
                } likeAction: { $product in
                    // like callback
                    product.isFav.toggle()
                }
                .padding(.horizontal)
            }
        }
        .activityIndicatorDefault(isLoading: appManager.globalLoadingState)
        .task {
            if !appManager.products.isEmpty { return }
            await appManager.loadData()
        }
    }
}
