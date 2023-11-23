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

@main
struct ShoeStoreWithReduxApp: App {
    
    init() {
        ApiConfig.shared.setUrl("http://192.168.0.129:3000/")
        dependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
    
    
}
