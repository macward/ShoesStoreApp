//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import DataLayer
import SwiftCommonLibrary
import UISharedElements
import ProductAdapters

public struct HomeScreen: View {
    @EnvironmentObject var appManager: GlobalDataManager
    
    @State private var path = NavigationPath()
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    private var adapter: (any ProductAdapters)?
    
    public init(adapter: (any ProductAdapters)?) {
        self.adapter = adapter
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $path) {
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
                        path.append("Popular shoes")
                    }
                    
                    // all prods
                    ProductsGridComponent(
                        products: $appManager.products,
                        selectedProduct: $selectedProduct,
                        openDetails: $openDetailScreen
                    ) {
                        // navigation action
                        path.append("New Shoes")
                    } likeAction: { $product in
                        // like callback
                        product.isFav.toggle()
                    }
                    .padding(.horizontal)
                }
            }
            .activityIndicatorDefault(isLoading: appManager.globalLoadingState)
            .navigationDestination(for: String.self) { title in
                adapter?.openProduct(title: title, path: $path)
            }
            .fullScreenCover(isPresented: $openDetailScreen, content: {
                adapter?.openProductDetail(product: $selectedProduct)
            })
            .task {
                if !appManager.products.isEmpty { return }
                await appManager.loadData()
            }
        }
    }
    
    
}
