//
//  BoxTransitionView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 05/10/2023.
//

import SwiftUI

struct BoxTransitionView: View {
    
    @Namespace var namespace
    @State private var show: Bool = false
    @State private var selectedImage: String?
    
    var body: some View {
        
        if show {
            if let selectedImage = selectedImage {
                image(selectedImage)
                    .scaleEffect(!show ? 1 : 1.7)
                    .ignoresSafeArea()
            }
        } else {
            Grid {
                GridRow {
                    image("nike_1")
                    image("nike_2")
                }
                
                GridRow {
                    image("nike_3")
                    image("nike_4")
                }
            }
        }
    }
    
    
    func image(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: name, in: namespace)
            .rotationEffect(.degrees(-45))
            .zIndex(selectedImage == name ? 1 : 0)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 2)) {
                    selectedImage = name
                    show.toggle()
                }
            }
    }
}

#Preview {
    BoxTransitionView()
}
