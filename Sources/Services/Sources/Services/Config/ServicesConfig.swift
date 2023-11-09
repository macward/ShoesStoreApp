//
//  File.swift
//  
//
//  Created by Max Ward on 08/11/2023.
//

import Foundation

public class ServicesConfig {
    public var baseUrl: String = ""
    
    public static var shared = ServicesConfig()
    
    public func setUrl(_ urlString: String) {
        self.baseUrl = urlString
    }
}
