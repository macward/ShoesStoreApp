//
//  File.swift
//  
//
//  Created by Max Ward on 11/11/2023.
//

import SwiftUI

public class AppRouter: ObservableObject {
    // Restricción: Debe ser privado para que el NavigationStack pueda vincularse a él
    @Published var path: NavigationPath

    public init(with path: NavigationPath) {
        self.path = path
    }

    public func navigate(to destination: any Hashable) {
        path.append(destination)
    }

    public func pop() {
        path.removeLast()
    }
}

public protocol ModuleRouter {
    var appRouter: AppRouter { get }
}

