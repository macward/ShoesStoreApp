//
//  ShoeCardView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ShoeCardView: View {
    var body: some View {
        VStack (spacing: 20) {
            // Shoe image
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.grayLite.gradient)
                    .aspectRatio(contentMode: .fit)
                Image("shoe_red")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
            }
            // description
            VStack {
                Text("Adidas Yung-1")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("$139.00")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            }
        }
    }
}

#Preview {
    ShoeCardView()
}
