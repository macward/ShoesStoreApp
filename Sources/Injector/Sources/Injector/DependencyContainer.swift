//
//  File.swift
//  
//
//  Created by Max Ward on 17/11/2023.
//

import Foundation

public class DependencyContainer: ObservableObject {
    public var features: FeaturesContainer
    
    public init() {
        self.features = FeaturesContainer()
    }
}

public class FeaturesContainer {
    
    // Content Feature
    public lazy var contentFeature: ContentInjector = {
        ContentInjector()
    }()
}

public class ContentInjector {}
