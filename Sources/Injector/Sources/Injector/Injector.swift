// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@propertyWrapper
public struct Dependency<Value>: DynamicProperty {
    @EnvironmentObject private var dependencyContainer: DependencyContainer
    
    public var wrappedValue: Value {
        get {
            dependencyContainer[keyPath: key]
        }
        nonmutating set {
            dependencyContainer[keyPath: key] = newValue
        }
    }
    
    private let key: ReferenceWritableKeyPath<DependencyContainer, Value>
    
    public init(_ key: ReferenceWritableKeyPath<DependencyContainer, Value>) {
        self.key = key
    }
}
