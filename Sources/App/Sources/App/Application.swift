//
//  File.swift
//  
//
//  Created by Max Ward on 09/11/2023.
//

import Coordinator
import SwiftUI

public struct Application: View {
    @Coordinator var coordinator

    public init() { }

    public var body: some View {
        RootView($coordinator)
    }

    public static func setInitialRoute(to route: Route) {
        RootSwitcher.setInitialRoute(to: route)
    }
}
