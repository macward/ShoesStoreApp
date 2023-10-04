//
//  ShoeDetailView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ShoeDetailView: View {
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        VerticalSizeControlView()
                        Spacer()
                    }
                    .overlay {
                        Image("nike_10")
                            .resizable()
                            .scaledToFit()
                            .flipHorizontal()
                            .offset(x: -14, y: 25)
                            .rotationEffect(.degrees(-55))
                            .scaleEffect(1.2)
                            .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 0)
                    }
                    
                    
                    HStack (alignment: .bottom) {
                        PriceView(value: 128.99)
                        Spacer()
                        InStockView(isInStock: true)
                    }
                    .padding(.top, 36)
                }
                .background(
                    Image("adidas_bg")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                )
                .safeAreaPadding(.horizontal)
            }
            
            VStack {
                // color control
                ColorControlView()
                    .padding(.bottom)
                
                Button("Add to Cart") {
                    print("sample")
                }
                .buttonStyle(GrayButton())
            }
            .padding(.vertical)
            .safeAreaPadding(.horizontal)
            
        }
    }
}

//#Preview {
//    ShoeDetailView(text: <#String#>, path: <#Binding<NavigationPath>#>)
//}
