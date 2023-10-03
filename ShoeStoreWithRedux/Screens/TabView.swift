//
//  TabView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct TabViewScreen: View {
    var body: some View {
        TabView {
            
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Favourites")
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
            
            Text("Notifications")
                .badge("2")
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
            
            Text("View 3")
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

#Preview {
    TabViewScreen()
}
