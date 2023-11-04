//
//  AsyncImageCached.swift
//  Shoe Store
//
//  Created by Max Ward on 04/11/2023.
//

import SwiftUI

struct AsyncImageCached<Content: View>: View {
    
    private let url: URL
    @ViewBuilder private var content: (Image) -> Content
    
    init(url: URL,
         content: @escaping (Image) -> Content
    ) {
        self.url = url
        self.content = content
    }
    
    var body: some View {
        
        CachedAsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .failure:
                ImageErrorView()
            case .success(let image):
                content(image)
            @unknown default:
                Image(systemName: "questionmark")
            }
        }
    }
}
