//
//  ShoeStoreWithReduxApp.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import DataLayer

@main
struct ShoeStoreWithReduxApp: App {
    
    @StateObject var appManager: GlobalDataManager = .init()
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environmentObject(appManager)
                .preferredColorScheme(.light)
        }
    }
}
