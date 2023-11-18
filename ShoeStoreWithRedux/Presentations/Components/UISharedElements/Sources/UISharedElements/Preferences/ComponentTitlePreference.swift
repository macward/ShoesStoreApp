//
//  ComponentTitlePreference.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 07/10/2023.
//

import SwiftUI

public struct ComponentTitlePreferenceKey: PreferenceKey {
    public typealias Value = String
    public static var defaultValue: String = ""
    
    public static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

public struct ComponentTitleViewModifier: ViewModifier {
    private var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public func body(content: Content) -> some View {
        content
            .preference(key: ComponentTitlePreferenceKey.self, value: title)
    }
}

public extension View {
    func componentTitle(title: String) -> some View {
        modifier(ComponentTitleViewModifier(title: title))
    }
}
