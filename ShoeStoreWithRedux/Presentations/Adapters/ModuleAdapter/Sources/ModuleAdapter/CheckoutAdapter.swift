// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public protocol CheckoutAdapter {
    @ViewBuilder
    func openCheckout() -> AnyView
}
