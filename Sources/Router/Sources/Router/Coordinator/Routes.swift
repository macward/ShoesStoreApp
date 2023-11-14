//
//  File.swift
//  
//
//  Created by Max Ward on 13/11/2023.
//

import SwiftUI
import DataLayer

public enum Route: Equatable, Identifiable, Hashable {
    case home
    case productDetail(Binding<Product?>)
    case productList(String)
    case favourites
    case shoppingCart
    case settings
    
    public var id: Int {
        hashValue
    }
    
    public static func == (lhs: Route, rhs: Route) -> Bool {
        if case .home = lhs, case .home = rhs { return true }
        if case .settings = lhs, case .settings = rhs { return true }
        if case .productDetail = lhs, case .productDetail = rhs { return true }
        if case .productList = lhs, case .productList = rhs { return true }
        if case .favourites = lhs, case .favourites = rhs { return true }
        if case .settings = lhs, case .settings = rhs { return true }
        return false
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine(1)
        case .productDetail:
            hasher.combine(2)
        case .productList:
            hasher.combine(3)
        case .favourites:
            hasher.combine(4)
        case .shoppingCart:
            hasher.combine(5)
        case .settings:
            hasher.combine(6)
        }
    }
}

public extension Route {
    private var factory: any Factory {
        self as! any Factory
    }

    var contentView: AnyView {
        factory.view()
    }
}
