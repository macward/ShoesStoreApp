//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 05/11/2023.
//

import SwiftUI

public struct GridContainer<Content: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    
    var data: Item
    @ViewBuilder var content: (Item.Element) -> Content
    
    public init(data: Item, content: @escaping (Item.Element) -> Content) {
        self.data = data
        self.content = content
    }
    
    public var body: some View {
        let gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
        
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach(data) { item in
                content(item)
            }
        }
    }
}
