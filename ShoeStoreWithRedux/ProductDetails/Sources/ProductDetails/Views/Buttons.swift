//
//  Buttons.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI
import DataLayer

struct Buttons: View {
    var body: some View {
        VStack {
            Button("Add to Cart") {
                //
            }
            .buttonStyle(GrayButton())
            
            HStack {
                PriceView(price: 128.99)
                Spacer()
                InStockView(isInStock: true)
            }
            .padding()
            
            ColorControlButton(color: .init(name: "Azul", color: .blue),
                               selected: .constant(.init(name: "Rojo", color: .red)))
        }
    }
}

#Preview {
    Buttons()
}
