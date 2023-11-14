//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 13/11/2023.
//

import SwiftUI

public struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    private var route: Route
    
    public init(route: Route) {
        self.route = route
    }
    
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(route: route)
                .navigationDestination(item: $coordinator.route, destination: { route in
                    route.contentView
                })
                .sheet(item: $coordinator.sheet) { sheet in
                    sheet.contentView
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    fullScreenCover.contentView
                }
        }
        .environmentObject(coordinator)
    }
}
