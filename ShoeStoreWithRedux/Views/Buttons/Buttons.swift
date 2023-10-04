//
//  Buttons.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color.white)
            .fontWeight(.bold)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(Color.grayMid)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


struct InStockView: View {
    var isInStock: Bool
    
    var body: some View {
        Text("In Stock").foregroundStyle(Color.white)
            .fontWeight(.bold)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isInStock ? Color.green : Color.grayLite)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct PriceView: View {
    var value: CGFloat
    
    var body: some View {
        HStack {
            Text("$128.99")
                .font(.system(size: 32))
                .fontWeight(.black)
        }
    }
}

struct Buttons: View {
    var body: some View {
        VStack {
            Button("Add to Cart") {
                print("sample")
            }
            .buttonStyle(GrayButton())
            
            HStack {
                PriceView(value: 128.99)
                Spacer()
                InStockView(isInStock: true)
            }
            .padding()
        }
    }
}

#Preview {
    Buttons()
}
