//
//  ShoeStoreWithReduxApp.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

@main
struct ShoeStoreWithReduxApp: App {
    
    @StateObject var appManager: GlobalAppManager = .init()
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environmentObject(appManager)
                .preferredColorScheme(.light)
        }
    }
}
