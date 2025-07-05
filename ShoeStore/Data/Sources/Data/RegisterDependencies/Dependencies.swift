//
//  File.swift
//  
//
//  Created by Max Ward on 22/11/2023.
//

import Foundation
import Injector

public struct Dependencies {
    public static func load() {
        DependencyInjector.register(type: ProductLocalDataSource.self, injectType: .runtime, factory: ProductLocalDataSourceDefault())
        DependencyInjector.register(type: ProductDataSource.self, injectType: .runtime, factory: ProductsAPIDataSourceDefault())
        DependencyInjector.register(type: ProductApiService.self, injectType: .runtime, factory: NWProductService())
    }
}
