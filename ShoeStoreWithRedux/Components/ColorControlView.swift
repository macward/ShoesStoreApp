//
//  ColorControlView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI

struct ColorControlItem: Identifiable {
    var id: String = UUID().uuidString
    var color: Color
}

struct ColorControlView: View {
    
    private var items: [ColorControlItem] = [
        .init(color: .black),
        .init(color: .grayMid),
        .init(color: .red),
        .init(color: .blue),
        .init(color: .black)
    ]
    
    @Binding private var selectedColor: ColorControlItem?
    
    init(selected: Binding<ColorControlItem?>) {
        self._selectedColor = selected
    }
    
    var body: some View {
        HStack (spacing: 20) {
            
            ForEach(items) { item in
                ColorControlButton(color: item, selected: $selectedColor)
            }
        }
    }
}

#Preview  {
    ColorControlView(selected: .constant(.init(color: .red)))
}
