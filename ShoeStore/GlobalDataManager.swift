//
//  GlobalAppManager.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI
import Combine
import DataLayer

public class GlobalDataManager: ObservableObject {
    
    // MARK: Public properties
    @Published public var products: [Product] = []
    @Published public var favourites: [Product] = []
    
    public init() {}
    
    // MARK: Methods
    public func handleFavourites(_ product: Product) {
        guard let index = products.firstIndex (where: { $0.id == product.id }) else { return }
        products[index].isFav.toggle()
    }
    
}

