//
//  ShoeCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ProductCardView: View {
    
    @Binding var product: Product
    var action: (Binding<Product>) -> Void
    
    var body: some View {
        VStack (spacing: 20) {
            // Shoe image
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.grayLite.gradient)
                    .aspectRatio(contentMode: .fit)
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black.opacity(0.3), radius: 12, x: 4, y: 4)
                    .padding(.all, 8)
            }
            // description
            VStack {
                Text("Adidas Yung-1")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("$139.00")
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
