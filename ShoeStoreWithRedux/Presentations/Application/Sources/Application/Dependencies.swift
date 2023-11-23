//
//  File.swift
//  
//
//  Created by Max Ward on 23/11/2023.
//

import Foundation
import Injector
import ProductDetails
import Data
import Domain
import ModuleAdapter

public struct Dependencies {
    public static func load() {
        
        DependencyInjector.register(type: ProductLocalDataSource.self, 
                                    injectType: .runtime,
                                    factory: ProductLocalDataSourceDefault())
        
        DependencyInjector.register(type: ProductDataSource.self, 
                                    injectType: .runtime,
                                    factory: ProductsAPIDataSourceDefault())
        
        DependencyInjector.register(type: ProductApiService.self, 
                                    injectType: .runtime,
                                    factory: NWProductService())
        
        DependencyInjector.register(type: GetProductsUseCase.self, 
                                    injectType: .runtime,
                                    factory: GetProductsUseCaseDefault())
        
        DependencyInjector.register(type: ProductAdapters.self,
                                    injectType: .runtime,
                                    factory: ProductAdapterDefault())
        
        DependencyInjector.register(type: ProductRepository.self,
                                    injectType: .runtime,
                                    factory: ProductRepositoryDefault())
        
    }
}
