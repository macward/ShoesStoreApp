//
//  ColorControlView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI
import DataLayer
import UISharedElements

public struct ColorControlView: View {
    
    private var items: [ColorControlItem] = [
        .init(name: "Negro", color: .black),
        .init(name: "Gris", color: Color.grayMid),
        .init(name: "Rojo",color: .red),
        .init(name: "Azul",color: .blue),
    ]
    
    @Binding private var selectedColor: ColorControlItem?
    
    public init(selected: Binding<ColorControlItem?>) {
        self._selectedColor = selected
    }
    
    public var body: some View {
        HStack (spacing: 20) {
            
            ForEach(items) { item in
                ColorControlButton(color: item, selected: $selectedColor)
            }
        }
    }
}

#Preview  {
    ColorControlView(selected: .constant(.init(name: "Rojo", color: .red)))
}
