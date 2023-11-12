//
//  File.swift
//  
//
//  Created by Max Ward on 11/11/2023.
//

import Foundation

import DataLayer
import SwiftUI
import ProductDetails
import Home

public extension View {
    @ViewBuilder
    func withHomeRoutes() -> some View {
        self.navigationDestination(for: HomeRoute.self) { destination in
            switch destination {
            case .details:
                ProductListScreen()
            }
        }
    }
}
