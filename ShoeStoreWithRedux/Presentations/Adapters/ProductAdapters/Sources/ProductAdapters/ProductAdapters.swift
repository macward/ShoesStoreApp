// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Domain

public protocol ProductAdapters {
    associatedtype Output
    
    @ViewBuilder
    func openProduct(title: String, path: Binding<NavigationPath>) -> AnyView
    
    @ViewBuilder
    func openProductDetail(product: Binding<Product?>) -> AnyView
}

