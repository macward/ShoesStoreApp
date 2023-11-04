//
//  FeaturedProductImage.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI
import DataLayer

struct FeaturedProductImage: View {
    var product: Product?
    var body: some View {
        AsyncImageCached(url: product?.imageUrl ?? URL(string:"")!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(-45))
                .shadow(color: .black.opacity(0.7), radius: 4, x: 2, y: 2)
        }
    }
}

#Preview {
    FeaturedProductImage(product: Product.mock)
}
