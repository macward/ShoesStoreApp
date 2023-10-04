//
//  MainSliderView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct MainSliderView: View {
    
    @Namespace var namespace
    var prducts: [Product]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(prducts) { product in
                    
                    SliderCardView {
                        cardBackContent()
                    } overlay: {
                        imageOverlay(product.image)
                    }
                    .scrollTransition{ content, phase in
                        content
                            .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                         y: phase.isIdentity ? 1 : 0.8)
                            .offset(x: phase.isIdentity ? 0 : -30)
                    }
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                }
            }
            .padding(.top)
            .contentMargins(16, for: .scrollContent)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .contentMargins(16, for: .scrollContent)
    }
    
    @ViewBuilder
    func cardBackContent() -> some View {
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
    
    @ViewBuilder
    func imageOverlay(_ image: String) -> some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(.degrees(45))
            .scaleEffect(1.4)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // flip image
            .offset(x: -54, y: -10) // positionate the image outside the container
            .shadow(color: .black.opacity(0.7), radius: 12, x: 2, y: 2) // ahh a shadow to the image
            .scrollTransition{ content, phase in
                content
                    .scaleEffect(x: phase.isIdentity ? 1 : 0.5,
                                 y: phase.isIdentity ? 1 : 0.5)
            }
            .visualEffect { content, proxy in
                content
                    .offset(x: scrollOffset(proxy))
            }
            .matchedGeometryEffect(id: "product_image", in: namespace)
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}
