//
//  File.swift
//  
//
//  Created by Max Ward on 09/11/2023.
//

import SwiftUI

public protocol Factory {
    associatedtype Content: View
    @ViewBuilder
    func contentView() -> Content
}

extension Factory {
    func view() -> AnyView {
        AnyView(contentView())
    }
}
