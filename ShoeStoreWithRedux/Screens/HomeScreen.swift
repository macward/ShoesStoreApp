//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct Product: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var image: String
}

struct HomeScreen: View {
    
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
                        ProductSliderView(sectionTitle: "Popular", products: popularProducts) {
                            path.append("Popular")
                        }
                        
                        // all prods
                        ProductsGridView(title: "Newest shoes", products: allProducts) {
                            path.append("Newest shoes")
                        }
                        .padding(.horizontal)
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
    
    @ViewBuilder
    func handleProductDetailScree(_ product: inout Product) -> some View {
        
    }
}

#Preview {
    HomeScreen(tabState: .constant(.visible))
}
