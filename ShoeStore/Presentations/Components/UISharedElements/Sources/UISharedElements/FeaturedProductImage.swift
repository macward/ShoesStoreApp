//
//  FeaturedProductImage.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

public struct FeaturedProductImage: View {
    var url: URL?
    
    public init(url: URL?) {
        self.url = url
    }
    
    public var body: some View {
        AsyncImageCached(url: url ?? URL(string:"http://localhost:3000/nike_1.png")!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(-45))
                .shadow(color: .black.opacity(0.7), radius: 4, x: 2, y: 2)
        }
    }
}

