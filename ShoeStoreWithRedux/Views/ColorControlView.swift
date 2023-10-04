//
//  ColorControlView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

struct ColorControlView: View {
    var body: some View {
        HStack (spacing: 20) {
            Circle()
                .fill(.black.gradient)
                .stroke(.black, lineWidth: 1)
                .frame(width: 40)
            
            Circle()
                .fill(.grayMid.gradient)
                .stroke(.grayMid, lineWidth: 1)
                .frame(width: 40)
            
            Circle()
                .fill(.white.gradient)
                .stroke(.grayLite, lineWidth: 1)
                .frame(width: 40)
                .background (
                    Circle()
                        .stroke(.black, style: .init(lineWidth: 1, dash: [4]))
                        .scaleEffect(1.4)
                )
            
            Circle()
                .fill(.red.gradient)
                .stroke(.red, lineWidth: 1)
                .frame(width: 40)
            
            Circle()
                .fill(.blue.gradient)
                .stroke(.blue, lineWidth: 1)
                .frame(width: 40)
            Spacer()
        }
    }
}

#Preview {
    ColorControlView()
}
