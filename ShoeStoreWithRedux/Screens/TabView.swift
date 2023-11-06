//
//  TabView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI
import Home
import ProductDetails

struct TabViewScreen: View {
    
    @State private var tabState: Visibility = .visible
    
    var body: some View {
        TabView {
            HomeScreen(tabState: $tabState)
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            FavouritesScreen(text: "Favourites")
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
