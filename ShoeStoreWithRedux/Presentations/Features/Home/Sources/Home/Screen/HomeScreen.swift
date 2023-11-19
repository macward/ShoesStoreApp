//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import Domain
import SwiftCommonLibrary
import UISharedElements
import ModuleAdapter
import ProductDetails

public struct HomeScreen: View {
    
    @State private var path = NavigationPath()
    private var repo: any ProductRepository
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    private var adapter: (any ProductAdapters)?
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.id, ascending: true)],
        animation: .default)
    private var products: FetchedResults<Product>
    
    public init(repo: any ProductRepository, adapter: (any ProductAdapters)?) {
        self.adapter = adapter
        self.repo = repo
    }
    
    public var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    // Main Slider
                    MainSliderView(
                        products: products,
                        selectedProduct: $selectedProduct,
                        actionOnTap: $openDetailScreen
                    ) { product in
                        SliderCardView(product: product)
                    }
                    
                    // Popular Slider
                    ProductSliderView(
                        sectionTitle: "Popular",
                        products: products,
                        selectedProduct: $selectedProduct,
                        actionOnTap: $openDetailScreen
                    ) {
                        path.append("Popular shoes")
                    }
                    
                    // all prods
                    ProductsGridComponent(
                        products: products,
                        selectedProduct: $selectedProduct,
                        openDetails: $openDetailScreen
                    ) {
                        // navigation action
                        path.append("New Shoes")
                    } likeAction: { product in
                        // like callback
                        product.isFav.toggle()
                    }
                    .padding(.horizontal)
                }
            }
            .activityIndicatorDefault(isLoading: false)
            .navigationDestination(for: String.self) { title in
                adapter?.openProduct(title: title, path: $path)
            }
            .fullScreenCover(isPresented: $openDetailScreen, content: {
                adapter?.openProductDetail(product: $selectedProduct)
            })
            .task {
//                if !appManager.products.isEmpty { return }
//                await appManager.loadData()
//                try? await repo.getProducts()
            }
        }
    }
    
    
}
