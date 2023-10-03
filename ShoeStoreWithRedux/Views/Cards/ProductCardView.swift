//
//  ShoeCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ProductCardView: View {
    
    var product: Product
    
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
    }
}

#Preview {
    ProductCardView(product: .init(image: "nike_1"))
}
