//
//  File.swift
//  
//
//  Created by Max Ward on 06/11/2023.
//

import SwiftUI
import DataLayer

public enum Screen: String, Identifiable {
    case home, products, favourites
    
    public var id: String {
        self.rawValue
    }
}

public enum FullScreenCover: Identifiable {
    case productDetails(Binding<Product?>)
    
    public var id: String {
        UUID().uuidString
    }
}

public class Coordinator: ObservableObject {
    @Published var path: NavigationPath = .init()
    @Published var fullscreenCover: FullScreenCover?
    @Published var screen: Screen?
    
    public init() {}
    
    public func push(_ screen: Screen) {
        self.path.append(screen)
    }
    
    public func present(_ fullScreenConver: FullScreenCover) {
        self.fullscreenCover = fullScreenConver
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
    
    public func dismiss() {
        self.fullscreenCover = nil
    }
    
    @ViewBuilder
    public func build(_ screen: Screen) -> some View {
        switch screen {
        case .home:
            //HomeScreen(model: tabState: .constant(Visibility.visible))
            EmptyView()
        case .favourites:
            FavouritesScreen(text: "Favourites")
        case .products:
            EmptyView()
        }
    }
    
    @ViewBuilder
    public func build(_ fullscreenCover: FullScreenCover) -> some View {
        switch fullscreenCover {
        case .productDetails(let product):
            ProductDetailScreen(product: product)
        }
    }
}
