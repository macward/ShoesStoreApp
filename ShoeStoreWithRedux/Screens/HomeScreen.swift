//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct Product: Identifiable {
    var id: UUID = UUID()
    var image: String
}

struct HomeScreen: View {
    
    @State private var path = NavigationPath()
    
    @State private var mainSliderProducts: [Product] = [
        .init(image: "nike_3"),
        .init(image: "nike_1"),
        .init(image: "adidas_6"),
        .init(image: "puma_3"),
        .init(image: "adidas_1"),
        .init(image: "puma_4"),
        .init(image: "puma_1")
    ]
    
    @State private var topSellsSliderProducts: [Product] = [
        .init(image: "adidas_6"),
        .init(image: "puma_4"),
        .init(image: "nike_7"),
        .init(image: "puma_6"),
        .init(image: "adidas_5"),
        .init(image: "nike_11"),
        .init(image: "nike_10")
    ]
    
    @State private var allProducts: [Product] = [
        .init(image: "nike_1"),
        .init(image: "nike_2"),
        .init(image: "nike_3"),
        .init(image: "nike_4")
    ]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    
                    // Main Slider
                    MainSliderView(prducts: mainSliderProducts)
                    
                    // Popular Slider
                    ProductSliderView(sectionTitle: "Popular", products: topSellsSliderProducts) {
                        path.append("Popular")
                    }
                    
                    // all prods
                    ProductsGridView(title: "Newest shoes", products: allProducts) {
                        path.append("Newest shoes")
                    }
                    .padding(.horizontal)
                }
                .navigationDestination(for: String.self) { textValue in
                    ListOfShoesScreen(text: textValue, path: $path)
                }
            }
        }
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}

#Preview {
    HomeScreen()
}
