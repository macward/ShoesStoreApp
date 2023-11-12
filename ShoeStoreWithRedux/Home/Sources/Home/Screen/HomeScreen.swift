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
import ProductDetails

public struct HomeScreen: View {
    @EnvironmentObject var appManager: GlobalDataManager
    
    var router: HomeRouting
    
    @State private var path = NavigationPath()
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    
    public init(router: HomeRouting) {
        self.router = router
    }
    
    public var body: some View {
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
                        //router.presentProductList()
                        router.navigate(to: .details)
                    }
                    
                    // all prods
                    ProductsGridComponent(products: $appManager.products,
                                          selectedProduct: $selectedProduct,
                                          openDetails: $openDetailScreen) {
                        print("open details")
                    } likeAction: { $product in
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
    
    
}
