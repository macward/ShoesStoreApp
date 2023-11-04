//
//  Buttons.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI
import DataLayer

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
    var price: CGFloat
    
    var body: some View {
        HStack {
            Text(String(describing: price))
                .font(.system(size: 32))
                .fontWeight(.black)
        }
    }
}

struct ColorControlButton: View {
    
    var color: ColorControlItem
    @Binding var selected: ColorControlItem?
    
    init(color: ColorControlItem, selected: Binding<ColorControlItem?>) {
        self.color = color
        self._selected = selected
    }
    
    var body: some View {
        Circle()
            .fill(color.color.gradient)
            .stroke(color.color, lineWidth: 1)
            .frame(width: 40)
            .background (
                Circle()
                    .stroke(.grayMid, style: .init(lineWidth: 1, dash: [4]))
                    .scaleEffect(selected?.id == color.id ? 1.4 : 1.0)
            )
            .onTapGesture {
                self.selected = color
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
