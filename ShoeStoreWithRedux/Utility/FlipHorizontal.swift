//
//  FlipHorizontal.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

struct FlipHorizontalModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // flip image
    }
}

extension View {
    func flipHorizontal() -> some View {
        modifier(FlipHorizontalModifier())
    }
}
