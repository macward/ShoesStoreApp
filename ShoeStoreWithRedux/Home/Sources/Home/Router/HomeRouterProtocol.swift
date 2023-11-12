//
//  File.swift
//  
//
//  Created by Max Ward on 12/11/2023.
//

import DataLayer
import SwiftUI

public protocol HomeRouterProtocol {
    
    func navigateToProducts()
    func render(destination: HomeDestinations) -> AnyView
}

public enum HomeDestinations: Hashable {
   case productList
}
