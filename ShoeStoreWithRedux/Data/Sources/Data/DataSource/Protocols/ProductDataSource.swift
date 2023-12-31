//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

public protocol ProductDataSource {
    func getProducts() async throws -> [ProductScheme]
}

public protocol ProductLocalDataSource {
    func storeProduct(_ schemes: [ProductScheme]) async throws
}
