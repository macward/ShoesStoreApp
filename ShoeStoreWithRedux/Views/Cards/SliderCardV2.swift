//
//  SliderCardV2.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI

struct SliderCardV2: View {
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
            .padding(.leading, 10)
            Spacer()
            
        }
        .overlay(content: {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .rotationEffect(.degrees(-45))
                .offset(x: 70)
                .shadow(radius: 4)
                .frame(width: 100, height: 300)
                .debugViewLimit(.red)
        })
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.grayMid.gradient)
                .frame(height: 200)
        )
        
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}

struct SliderCardTransitionV2: View  {
    @State var show: Bool = false
    @Namespace var namespace
    
    var body: some View {
        if !show {
            SliderCardV2(product: .init(image: "nike_10"), namespace: namespace)
            .padding(.horizontal)
        } else {
            ShoeDetailView(product: .init(image: "nike_10"), namespace: namespace, magnify: $show)
        }
    }
}

#Preview {
    SliderCardTransitionV2()
}
