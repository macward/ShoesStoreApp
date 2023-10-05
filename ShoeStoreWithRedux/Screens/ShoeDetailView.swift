//
//  ShoeDetailView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ShoeDetailView: View {
    
    var product: Product
    var namespace: Namespace.ID
    @Binding var magnify: Bool
    @State var appear = [false, false, false, false]
    
    @State private var selectedColor: ColorControlItem?
    @State private var selectedSize: SizeControlItem?
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            VerticalSizeControlView(selected: $selectedSize)
                                .offset(x: appear[0] ? 0 : -80)
                            Spacer()
                        }
                        .background(
                            FeaturedProductImage(product: product)
                                .matchedGeometryEffect(id: "product_image\(product.id)", in: namespace)
                        )
                        
                        HStack (alignment: .bottom) {
                            PriceView(value: 128.99)
                                .offset(x: appear[0] ? 0 : -80)
                            Spacer()
                            InStockView(isInStock: true)
                                .offset(x: appear[0] ? 0 : 80)
                        }
                        .padding(.top, 36)
                        .opacity(appear[2] ? 1 : 0)
                    }
                    .background(
                        Image("adidas_bg")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.6)
                            .opacity(appear[0] ? 1 : 0)
                    )
                    .safeAreaPadding(.horizontal)
                }
                VStack {
                    // color control
                    HStack {
                        ColorControlView(selected: $selectedColor)
                            .padding(.bottom)
                            .offset(y: appear[2] ? 0 : 80)
                            .opacity(appear[2] ? 1 : 0)
                        Spacer()
                    }
                    
                    Button("Add to Cart") {
                        print("sample")
                    }
                    .buttonStyle(GrayButton())
                    .offset(y: appear[0] ? 0 : 80)
                }
                .padding(.vertical)
                .safeAreaPadding(.horizontal)
                
            }
            .padding(.top, 64)
            .coordinateSpace(name: "scroll")
            .ignoresSafeArea()
            .overlay (alignment: .topTrailing) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(Color.grayMid)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        withAnimation(.closeCard) {
                            magnify.toggle()
                            //model.showDetail.toggle()
                        }
                    }
                    
            }
            .onAppear {
                fadeIn()
            }
            .onChange(of: magnify) { _, _ in
                fadeOut()
            }
        }
    }
    
    func fadeIn() {
        
        withAnimation(.easeOut.delay(0.2)) {
            appear[0] = true
        }
        
        withAnimation(.easeOut.delay(0.3)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[2] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[3] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
        appear[3] = false
    }
}

extension Animation {
    static let openCard = Animation.spring(response: 0.4, dampingFraction: 0.9)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}


struct ShoeDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ShoeDetailView(product: .init(image: "nike_10"), namespace: namespace, magnify: .constant(true))
    }
    
}
