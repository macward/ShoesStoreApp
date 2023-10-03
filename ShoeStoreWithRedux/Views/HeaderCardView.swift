//
//  HeaderCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct HeaderCardView<Content: View>: View {
    
    @ViewBuilder var content: Content
    
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
            content
        })
        .padding(.vertical, 30)
    }
}

struct CardViewSample: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach (0...10, id: \.self) { _ in
                    HeaderCardView {
                        Image("shoe_yellow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(.degrees(-45))
                            .scaleEffect(1.2)
                            .offset(x: 0, y: -10)
                    }
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                }
            }
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.paging)
    }
}

#Preview(body: {
    CardViewSample()
})

