//
//  MainSliderView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct MainSliderView<Content: View>: View {
    
    @Binding var magnify: Bool
    var namespace: Namespace.ID
    var prducts: [Product]
    @Binding var selectedIndex: String
    @ViewBuilder var content: (Product) -> Content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(prducts) { product in
                    //SliderCardV2(product: product, namespace: namespace)
                    //SliderCardView(product: product, namespace: namespace)
                    content(product)
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                         y: phase.isIdentity ? 1 : 0.8)
                                .offset(x: phase.isIdentity ? 0 : -30)
                        }
                        .onTapGesture {
                            selectedIndex = product.id
                            withAnimation (.openCard) {
                                magnify.toggle()
                            }
                        }
                }
            }
            .padding(.top)
            .contentMargins(16, for: .scrollContent)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .contentMargins(16, for: .scrollContent)
    }
}


//struct MainSliderView_Previews: PreviewProvider {
//    @Namespace static var namespace
//    static var previews: some View {
//        MainSliderView(magnify: .constant(false), namespace: namespace, prducts: Mock.mainSliderProducts, selectedIndex: .constant("123"))
//    }
//    
//}
