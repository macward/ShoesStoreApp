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

@main
struct ShoeStoreWithReduxApp: App {
    
    @StateObject var appManager: GlobalDataManager = GlobalDataManager(getProductsUseCase: GetProductsUseCaseDefault(repo: ProductRepositoryDefault(dataSource: ProductsAPIDataSourceDefault())))
    
    init() {
        ApiConfig.shared.setUrl("http://192.168.0.129:3000/")
    }
    
    var body: some Scene {
        WindowGroup {
            TabViewScreen()
                .environmentObject(appManager)
                .preferredColorScheme(.light)
            
                
        }
    }
}
