//
//  ShoeStoreWithReduxApp.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import Domain
import Data
import Application
import Injector
import ModuleAdapter
import ProductDetails

@main
struct ShoeStoreWithReduxApp: App {
    
    init() {
        ApiConfig.shared.setUrl("http://localhost:3000/")
        Application.Dependencies.load()
    }
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
    
    
}
