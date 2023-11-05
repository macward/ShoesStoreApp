//
//  VerticalSizeControlView.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 04/10/2023.
//

import SwiftUI
import DataLayer
import SwiftCommonLibrary
import UISharedElements

public struct VerticalSizeControlView: View {
    
    private var items: [SizeControlItem] = [
        .init(size: 37, available: true),
        .init(size: 38, available: true),
        .init(size: 39, available: true),
        .init(size: 40, available: false),
        .init(size: 41, available: true),
        .init(size: 42, available: true),
        .init(size: 43, available: true)
    ]
    
    @Binding var selected: SizeControlItem?
    
    public init(selected: Binding<SizeControlItem?>) {
        self._selected = selected
    }
    
    public var body: some View {
        VStack {
            ForEach(items) { item in
                Text(item.size.description)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(item.size == selected?.size ? Color.white : Color.grayMid)
                    .padding()
                    .background(item.size == selected?.size ? Color.grayMid : Color.grayLite)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(item.available ? 1 : 0.4)
                    .onTapGesture {
                        if item.available {
                            selected = item
                        }
                        
                    }
            }
        }
    }
}

//#Preview {
//    VerticalSizeControlView(selected: .constant(.init(size: 36, available: true)))
//}
