//
//  ShoeStoreWithReduxApp.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import DataLayer
import Services
import Application
import Router

@main
struct ShoeStoreWithReduxApp: App {
    
    @StateObject var appManager: GlobalDataManager = .init()
    @StateObject private var coordinator = Coordinator()
    
    init() {
        ServicesConfig.shared.setUrl("http://192.168.0.129:3000/")
    }
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environmentObject(appManager)
                .environmentObject(coordinator)
                .preferredColorScheme(.light)
            
                
        }
    }
}
