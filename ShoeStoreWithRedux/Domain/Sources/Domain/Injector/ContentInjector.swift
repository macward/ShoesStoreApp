//
//  File.swift
//  
//
//  Created by Max Ward on 17/11/2023.
//

import Foundation
import Injector

//extension ContentInjector {
//    var getUseCase: GetProductsUseCase {
//        GetProductsUseCaseDefault(repo: <#T##ProductRepository#>)
//    }
//}

protocol InjectProduct {
    var useCaseInjected: GetProductsUseCase { get }
}
