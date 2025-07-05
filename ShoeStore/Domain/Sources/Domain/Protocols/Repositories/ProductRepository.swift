//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

public protocol ProductRepository {
    func getProducts() async throws
}
