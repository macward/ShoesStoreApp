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
import CoreData
import Injector

public struct HomeScreen: View {
    
    @Injector(.runtime) private var repo: ProductRepository
    @Injector(.runtime) private var adapter: ProductAdapters
    
    @State private var path = NavigationPath()
    
    @State private var selectedProduct: Product?
    @State private var openDetailScreen: Bool = false
    
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "isTop == true")
    ) var topProducts: FetchedResults<Product>
    
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "isFeatured == true")
    ) var featuredProducts: FetchedResults<Product>
    
    @FetchRequest(sortDescriptors: [])
    var products: FetchedResults<Product>
    
    let gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    public init() {
//        let request: NSFetchRequest<Product> = Product.fetchRequest()
//        request.sortDescriptors = []
//        request.fetchLimit = 4
//        _products = FetchRequest(fetchRequest: request)
    }
    
    public var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    // Main Slider
                    MainSliderView(
                        products: featuredProducts,
                        selectedProduct: $selectedProduct,
                        actionOnTap: $openDetailScreen
                    ) { product in
                        SliderCardView(product: product)
                    }
                    
                    // Popular Slider
                    ProductSliderView(
                        sectionTitle: "Popular",
                        products: topProducts,
                        selectedProduct: $selectedProduct,
                        actionOnTap: $openDetailScreen
                    ) {
                        path.append("Popular shoes")
                    }
                    
                    // all prods
                    ProductsGridComponent(path: $path)
                        .padding(.horizontal)
                }
            }
            .activityIndicatorDefault(isLoading: false)
            .navigationDestination(for: String.self) { title in
                adapter.productList(title: title, path: $path)
            }
            .fullScreenCover(isPresented: $openDetailScreen, content: {
                adapter.openProductDetail(product: $selectedProduct)
            })
            .task {
                if self.products.isEmpty {
                    try? await repo.getProducts()
                }
            }
        }
    }
    
    
}
