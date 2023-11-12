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
import DataLayer
import Router

public struct TabViewScreen: View {
    
    @State private var tabState: Visibility = .visible
    @EnvironmentObject var appManager: GlobalDataManager
    
    public init() {}
    
    public var body: some View {
        TabView {
            
            HomeScreen()
            .toolbar(tabState, for: .tabBar)
            .animation(.easeInOut(duration: 0.3), value: tabState)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            FavouritesScreen()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
            
            ShoppingCartScreen()
                .tabItem {
                    Label("Cart", systemImage: "bag")
                }
            Text("View 3")
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}
