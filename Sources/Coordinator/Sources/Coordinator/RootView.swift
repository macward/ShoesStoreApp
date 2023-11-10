//
//  File.swift
//  
//
//  Created by Max Ward on 09/11/2023.
//

import SwiftUI

public struct RootView: View {
    let coordinator: Coordinator

    public init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    @ViewBuilder
    public var body: some View {
        switch coordinator.rootSwitcher.switchRoute {
        case .none:
            EmptyView()
        case .some(let route):
            route.contentView
        }
    }
}
