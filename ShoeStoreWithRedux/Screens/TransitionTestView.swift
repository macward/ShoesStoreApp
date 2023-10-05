//
//  TransitionTestView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI

struct TransitionTestView: View {
    
    @State var magnify: Bool = false
    @Namespace var namespace
    @State private var selectedColor: ColorControlItem?
    @State private var selectedSize: SizeControlItem?
    
    var body: some View {
        ZStack {
            
            if magnify {
                ScrollView {
                    VStack {
                        HStack {
                            
                            VerticalSizeControlView(selected: $selectedSize)
                            
                            Image("nike_10")
                                .resizable()
                                .scaledToFit()
                                .rotationEffect(.degrees(-45))
                                .scaleEffect(1.3)
                                .matchedGeometryEffect(id: "image", in: namespace)
                            Spacer()
                            
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.grayMid.gradient)
                            .matchedGeometryEffect(id: "bg", in: namespace)
                    )
                    .overlay (alignment: .topTrailing) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                            .padding(.trailing, 30)
                        
                    }
                    .mask({
                        RoundedRectangle(cornerRadius: 10)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    })
                    .frame(height: 500)
                    .ignoresSafeArea()
                }
                .zIndex(1)
            }
            
            if !magnify {
                ScrollView(.horizontal) {
                    HStack {
                        
                        card
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                            .debugViewLimit()
                        card
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                            .debugViewLimit(.red)
                        card
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        card
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .contentMargins(16, for: .scrollContent)
            }
            // fullscreen detail
        }
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation (.easeInOut(duration: 0.2)) {
                magnify.toggle()
            }
        }
    }
    
    
    var card: some View {
        VStack {
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
                
                Image("nike_10")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(-45))
                    .scaleEffect(1.3)
                    .offset(x: 10)
                    .shadow(radius: 4)
                    .matchedGeometryEffect(id: "image_\(Int.random(in: 0...1000))", in: namespace)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.grayMid.gradient)
                    .frame(height: 150)
                    .matchedGeometryEffect(id: "bg_\(Int.random(in: 0...100))", in: namespace)
                
            )
        }
    }
}

#Preview {
    TransitionTestView()
}
