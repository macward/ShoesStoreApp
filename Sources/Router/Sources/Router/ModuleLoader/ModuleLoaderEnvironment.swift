//
//  File.swift
//  
//
//  Created by Max Ward on 14/11/2023.
//

import SwiftUI

private struct LoderEnvironment: EnvironmentKey {
    public static let defaultValue: ModuleLoader = .shared
}

extension EnvironmentValues {
    public var loader: ModuleLoader {
        get { self[LoderEnvironment.self] }
        set { self[LoderEnvironment.self] = newValue }
    }
}
