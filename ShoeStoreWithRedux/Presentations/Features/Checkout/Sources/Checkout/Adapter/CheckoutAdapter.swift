//
//  File.swift
//  
//
//  Created by Max Ward on 17/11/2023.
//

import SwiftUI
import ModuleAdapter

public struct CheckoutAdapterDefault: CheckoutAdapter {
    public init() {}
    public func openCheckout() -> AnyView {
        AnyView(CheckoutScreen())
    }
}
