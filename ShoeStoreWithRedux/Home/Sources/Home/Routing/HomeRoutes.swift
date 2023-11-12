//
//  File.swift
//  
//
//  Created by Max Ward on 11/11/2023.
//

import Foundation
import DataLayer

public enum HomeRoute: Hashable {
    case details
}

// El router del módulo
public class HomeRouting: ModuleRouter {
    
    public var appRouter: AppRouter
    
    public init(with appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    public func navigate(to target: HomeRoute) {
        appRouter.navigate(to: target)
    }

    public func pop() {
        appRouter.pop()
    }
}
