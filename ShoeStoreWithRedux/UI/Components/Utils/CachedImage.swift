//
//  CachedImage.swift
//  Shoe Store
//
//  Created by Max Ward on 04/11/2023.
//

import SwiftUI
import SwiftCommonLibrary
struct CachedImage<Content: View, ActivityView: View, ErrorView: View>: View {
    
    private let url: URL
    @ViewBuilder private var content: (Image) -> Content
    @ViewBuilder private let activityView: () -> ActivityView
    @ViewBuilder private let errorView: () -> ErrorView
    
    init(url: URL, 
         content: @escaping (Image) -> Content,
         activityView: @escaping () -> ActivityView,
         errorView: @escaping () -> ErrorView
    ) {
        self.url = url
        self.content = content
        self.activityView = activityView
        self.errorView = errorView
    }
    
    var body: some View {
        
        CachedAsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                activityView()
            case .failure:
                errorView()
            case .success(let image):
                content(image)
            @unknown default:
                Image(systemName: "questionmark")
            }
        }
    }
}

//#Preview {
//    CachedImage()
//}
