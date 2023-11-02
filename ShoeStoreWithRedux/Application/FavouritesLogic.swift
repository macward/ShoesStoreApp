//
//  FavouritesLogic.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/11/2023.
//

import Foundation

class TemporalDataStore {
    
    var favStore: [Product] = []
    
}

class FavoriteManager: ObservableObject {
    @Published var favourites: [Product] = []
}
