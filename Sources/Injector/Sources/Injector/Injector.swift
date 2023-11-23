// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@propertyWrapper
public struct Injector<T>{
    public var wrappedValue:T
    public init(_ injectType:InjectType = .runtime){
        self.wrappedValue = DependencyInjector.resolve(injectType: injectType)
    }
}
