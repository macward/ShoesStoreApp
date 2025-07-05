//
//  ProductSliderView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI
import Domain
import CoreData
import UISharedElements

public struct ProductSliderView: View {
    
    var sectionTitle: String
    var products: FetchedResults<Product>
    var callback: () -> Void
    @Binding var selectedProduct: Product?
    @Binding var actionOnTap: Bool
    
    public init(sectionTitle: String,
         products: FetchedResults<Product>,
         selectedProduct: Binding<Product?>,
         actionOnTap: Binding<Bool>,
         callback: @escaping () -> Void
    ) {
        self.sectionTitle = sectionTitle
        self.products = products
        self._selectedProduct = selectedProduct
        self._actionOnTap = actionOnTap
        self.callback = callback
    }
    
    public var body: some View {
        VStack {
            SectionHeaderAction(title: sectionTitle, callback: callback)
            .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(products) { product in
                        GeometryReader(content: { geometry in
                            HStack (spacing: 32) {
                                VStack (alignment: .leading, spacing: 30) {
                                    Image("justdoitnike")
                                        
                                    Text("Explore Now >")
                                        .font(.title3.bold())
                                        .foregroundStyle(Color.white)
                                }
                                .padding(.leading, 32)
                                Spacer()
                            }
                            .frame(height: 160)
                            .background(Color.grayLite.gradient)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .scrollTransition{ content, phase in
                                content
                                    .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                                 y: phase.isIdentity ? 1 : 0.8)
                            }
                            .overlay {
                                AsyncImageCached(url: product.imageUrl, content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .rotationEffect(.degrees(-45))
                                        .scaleEffect(1.3)
                                        .offset(x: 50, y: 5)
                                        .visualEffect { content, geometryProxy in
                                            content.offset(x: scrollOffset(geometryProxy))
                                        }
                                        .shadow(color: .black.opacity(0.6), radius: 4, x: 2, y: 0)
                                })
                                    
                            }
                        })
                        .frame(width: 300, height: 160)
                        .onTapGesture {
                            selectedProduct = product
                            actionOnTap.toggle()
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(16, for: .scrollContent)
            .offset(y: -16)
        }
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}
