//
//  ShoeCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import Domain
import UISharedElements

public struct ProductCardView: View {
    
    @Binding var product: Product
    var action: (Binding<Product>) -> Void
    
    public init(product: Binding<Product>, action: @escaping (Binding<Product>) -> Void) {
        self._product = product
        self.action = action
    }
    
    public var body: some View {
        VStack (spacing: 20) {
            // Shoe image
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.grayLite.gradient)
                    .aspectRatio(contentMode: .fit)
                
                AsyncImageCached(url: product.imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(-45))
                        .shadow(color: .black.opacity(0.7), radius: 4, x: 2, y: 2)
                }
                .padding(.all, 8)
            }
            // description
            VStack {
                Text(product.title)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(String(describing: product.price))
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            }
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: product.isFav ? "heart.fill" : "heart")
                .font(.system(size: 28))
                .foregroundStyle(product.isFav ? Color.red.gradient : Color.gray.gradient)
                .padding(.trailing, 8)
                .padding(.top, 8)
                .onTapGesture {
                    action($product)
                }
        }
    }
}

//struct ProductCardSampleView: View {
//    var body: some View {
//        HStack {
//            ProductCardView(product: .init(image: "nike_1"), action: { _ in})
//            ProductCardView(product: .init(image: "nike_1"), action: { _ in})
//        }
//        .padding(.horizontal)
//        
//    }
//}
//
//
//#Preview {
//    ProductCardSampleView()
//}
