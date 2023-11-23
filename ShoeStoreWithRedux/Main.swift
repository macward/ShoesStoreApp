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
        ApiConfig.shared.setUrl("http://192.168.0.129:3000/")
        Dependencies.load()
        Domain.LoadDependencies.load()
        DependencyInjector.register(type: ProductAdapters.self, injectType: .runtime, factory: ProductAdapterDefault())
        DependencyInjector.register(type: ProductRepository.self, injectType: .runtime, factory: ProductRepositoryDefault())
    }
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
    
    
}
