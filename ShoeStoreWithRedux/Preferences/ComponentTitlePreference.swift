//
//  ComponentTitlePreference.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 07/10/2023.
//

import SwiftUI

struct ComponentTitlePreferenceKey: PreferenceKey {
    typealias Value = String
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct ComponentTitleViewModifier: ViewModifier {
    var title: String
    
    func body(content: Content) -> some View {
        content
            .preference(key: ComponentTitlePreferenceKey.self, value: title)
    }
}

extension View {
    func componentTitle(title: String) -> some View {
        modifier(ComponentTitleViewModifier(title: title))
    }
}
