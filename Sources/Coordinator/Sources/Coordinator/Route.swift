//
//  File.swift
//  
//
//  Created by Max Ward on 09/11/2023.
//

import SwiftUI
import Foundation
import DataLayer

public enum Route: Equatable, Identifiable {
    case home(Visibility)
    case product([Product])
    case details
    case favourites

    public var id: String {
        UUID().uuidString
    }
}

extension Route {
    private var factory: any Factory {
        self as! any Factory
    }

    var contentView: AnyView {
        factory.view()
    }
}
