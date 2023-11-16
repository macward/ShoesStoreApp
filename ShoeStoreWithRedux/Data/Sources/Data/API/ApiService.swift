//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation
import NetworkWrapper

public class NWProductService {
    
    private var dispatcher = Dispatcher(baseUrl: ApiConfig.shared.baseUrl)
    
    public init() {}
    
    public func getAll() async throws -> [ProductScheme] {
        let result = try await dispatcher.execute(request: ProductEndpoint.all,
                                                  of: [ProductScheme].self)
        return result
    }
    
}
