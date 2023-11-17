//
//  File.swift
//  
//
//  Created by Max Ward on 17/11/2023.
//

import Foundation
import Domain
import Injector

public extension ContentInjector {
    
    func productDataSource() -> any ProductDataSource  {
        ProductsAPIDataSourceDefault()
    }
    
    func productRespository() -> any ProductRepository {
        ProductRepositoryDefault(dataSource: productDataSource())
    }
    
    func getProductUseCase() -> GetProductsUseCase {
        GetProductsUseCaseDefault(repo: productRespository())
    }
    
}
