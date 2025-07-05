//
//  File.swift
//  
//
//  Created by Max Ward on 16/11/2023.
//

import Foundation

public class ApiConfig {
    public var baseUrl: String = ""
    
    public static var shared = ApiConfig()
    
    public func setUrl(_ urlString: String) {
        self.baseUrl = urlString
    }
}
