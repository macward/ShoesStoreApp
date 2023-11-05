//
//  HeaderCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import DataLayer
import UISharedElements

struct SliderCardView: View {
    
    var product: Product
    
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
            FeaturedProductImage(url: product.imageUrl)
                .frame(height: 290)
                .offset(x: 35,y: -45)
        })
        .padding(.vertical, 30)
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}
