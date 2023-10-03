//
//  MainSliderView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 03/10/2023.
//

import SwiftUI

struct MainSliderView<Content: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    
    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($data) { item in
                    HeaderCardView {
                        content(item)
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
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}
