//
//  File.swift
//  
//
//  Created by Max Ward on 22/11/2023.
//

import Foundation
import Injector

public struct LoadDependencies {
    public static func load() {
        DependencyInjector.register(type: GetProductsUseCase.self, injectType: .runtime, factory: GetProductsUseCaseDefault())
    }
}

