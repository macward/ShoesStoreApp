//
//  HeaderCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct SliderCardView<Content: View, BackContent: View>: View {
    
    @ViewBuilder var backContent: BackContent
    @ViewBuilder var overlay: Content
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 30) {
                backContent
            }
            .padding(.leading, 32)
            Spacer()
        }
        .frame(height: 200)
        .background(Color.grayMid)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(alignment: .topTrailing, content: {
            overlay
        })
        .padding(.vertical, 30)
    }
}


#Preview(body: {
    SliderCardView {
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
    } overlay: {
        Image("shoe_yellow")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(.degrees(-45))
            .scaleEffect(1.2)
            .offset(x: 0, y: -10)
    }
    .padding(.horizontal)
})

