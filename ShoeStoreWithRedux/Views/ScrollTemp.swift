//
//  ScrollTemp.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

struct ScrollTemp: View {
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.orange.gradient)
                .frame(height: 400)
            
            Rectangle()
                .fill(.orange.gradient)
                .frame(height: 400)
            
            Rectangle()
                .fill(.orange.gradient)
                .frame(height: 400)
            
            Rectangle()
                .fill(.orange.gradient)
                .frame(height: 400)
        }
    }
}

#Preview {
    ScrollTemp()
}
