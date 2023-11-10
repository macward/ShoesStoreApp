//
//  File.swift
//  
//
//  Created by Max Ward on 09/11/2023.
//

import Foundation

public class RootSwitcher: ObservableObject {
    @Published var switchRoute: Route?

    private init() { }

    static let shared = RootSwitcher()

    public static func setInitialRoute(to route: Route) {
        shared.switchRoute = route
    }
}
