//
//  File.swift
//  
//
//  Created by Max Ward on 02/11/2023.
//

import Foundation

public protocol ProductRepository {
    associatedtype Output
    static func get() async throws -> Output
}
