//
//  TabView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI
import Home
import ProductDetails
import ShoppingCart
import Domain
import Data
import ModuleAdapter
import Checkout

public struct TabViewScreen: View {
    
    @State private var tabState: Visibility = .visible
    
    let repo = ProductRepositoryDefault()
    
    public init() {}
    
    public var body: some View {
        TabView {
            
            HomeScreen()
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProductAdapterDefault().favoriteScreen()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
            
            ShoppingEmptyScreen()
                .tabItem {
                    Label("Cart", systemImage: "bag")
                }
            
            AccountScreen()
                .tabItem {
                    Label("Account", systemImage: "gear")
                }
        }
    }
}
