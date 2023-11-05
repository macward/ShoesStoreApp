//
//  File.swift
//  
//
//  Created by Max Ward on 04/11/2023.
//

import SwiftUI
import DataLayer

struct InStockView: View {
    var isInStock: Bool
    var body: some View {
        Text("In Stock").foregroundStyle(Color.white)
            .fontWeight(.bold)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isInStock ? Color.green : Color.gray) // replace gray with .graylite
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

public struct ColorControlButton: View {
    
    var color: ColorControlItem
    @Binding var selected: ColorControlItem?
    
    public init(color: ColorControlItem, selected: Binding<ColorControlItem?>) {
        self.color = color
        self._selected = selected
    }
    
    public var body: some View {
        Circle()
            .fill(color.color.gradient)
            .stroke(color.color, lineWidth: 1)
            .frame(width: 40)
            .background (
                Circle()
                    .stroke(.gray, style: .init(lineWidth: 1, dash: [4])) // replace grat with graymid
                    .scaleEffect(selected?.id == color.id ? 1.4 : 1.0)
            )
            .onTapGesture {
                self.selected = color
            }
    }
}

public struct GrayButton: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color.white)
            .fontWeight(.bold)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(Color.gray) // replace gray with grayMid
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

