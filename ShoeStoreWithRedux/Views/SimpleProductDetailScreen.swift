//
//  SimpleProductDetailScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

struct SimpleProductDetailScreen: View {

    var product: Product
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State private var appear = [true, true, true]
    @State private var angles: CGFloat = -55
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                
                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .debugViewLimit()
                .background(
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(45))
                        .scaleEffect(1.4)
                        .flipHorizontal()
                        .offset(x: -54, y: -10) // positionate the image outside the container
                        .shadow(color: .black.opacity(0.7), radius: 12, x: 2, y: 2) // ahh a shadow to the image
                        .matchedGeometryEffect(id: "product_image\(product.id)", in: namespace)
                        
                )
            }
            .overlay (alignment: .topTrailing) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(Color.white)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        withAnimation(.closeCard) {
                            show.toggle()
                            //model.showDetail.toggle()
                        }
                    }
                    
            }
        }
        .coordinateSpace(name: "scroll")
    }
}

struct SimpleProductDetailScreen_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        SimpleProductDetailScreen(product: .init(image: "nike_10"), namespace: namespace, show: .constant(true))
    }
    
}
