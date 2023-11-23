//
//  File.swift
//  
//
//  Created by Max Ward on 17/11/2023.
//

import Foundation

public enum InjectType {
    case singleton
    case runtime
}

public final class DependencyInjector {
    
    private  var cache: [String: Any] = [:]
    private  var generators: [String: ()->Any] = [:]
    private static let shared = DependencyInjector.init()
    
    public static func register<T>(type: T.Type, injectType: InjectType, factory: @autoclosure @escaping ()->T) {
        shared.generators[String(describing: type.self)] = factory
        if( injectType == .singleton){
            shared.cache[String(describing: type.self)] = factory()
        }
    }
    
    public static func resolve<T>(injectType:InjectType = .runtime)->T{
        let key = String(describing: T.self)
        switch injectType {
            case .singleton:
            guard let dependency =  shared.cache[key] as? T else{
                fatalError("\(key): Singleton Dependency not found. Please Register the dependency first.")
            }
            return dependency
        case .runtime:
            guard let dependency =  shared.generators[key]?() as? T else{
                fatalError("\(key): Dependency not found. Please Register the dependency first.")
            }
            return dependency
        }
    }
}
