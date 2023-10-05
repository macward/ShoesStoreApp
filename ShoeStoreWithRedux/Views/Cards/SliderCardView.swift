//
//  HeaderCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct SliderCardView: View {
    
    var product: Product
    var namespace: Namespace.ID
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 30) {
                Image("justdoitnike")
                HStack {
                    Text("Explore Now")
                        .font(.title3.bold())
                        .foregroundStyle(Color.white)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .offset(y: 1)
                }
            }
            .padding(.leading, 32)
            Spacer()
        }
        .frame(height: 200)
        .background(Color.grayMid)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(alignment: .topTrailing, content: {
            FeaturedProductImage(product: product)
                .scaleEffect(1.4)
                .matchedGeometryEffect(id: "product_image\(product.id)", in: namespace)
        })
        .padding(.vertical, 30)
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}

struct SliderCardTransition: View  {
    @State var show: Bool = false
    @Namespace var namespace
    
    var body: some View {
        if !show {
            SliderCardView(product: .init(image: "nike_10"), namespace: namespace)
            .padding(.horizontal)
        } else {
            ShoeDetailView(product: .init(image: "nike_10"), namespace: namespace, show: $show)
        }
    }
}


#Preview(body: {
    SliderCardTransition()
})

//#Preview(body: {
//    SliderCardView {
//        Image("justdoitnike")
//        HStack {
//            Text("Explore Now")
//                .font(.title3.bold())
//                .foregroundStyle(Color.white)
//            Image(systemName: "chevron.right")
//                .font(.system(size: 14))
//                .fontWeight(.bold)
//                .foregroundStyle(Color.white)
//                .offset(y: 1)
//        }
//    } overlay: {
//        Image("nike_1")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .rotationEffect(.degrees(45))
//            .scaleEffect(1.2)
//            .flipHorizontal()
//            .offset(x: 0, y: -10)
//            .shadow(radius: 2)
//    }
//    .padding(.horizontal)
//})

