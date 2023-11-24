//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 24/11/2023.
//

import SwiftUI

public struct RowView<Content: View>: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    @ViewBuilder var content: Content
    
    public init(imageName: String, title: String, tintColor: Color, content: @escaping () -> Content) {
        self.imageName = imageName
        self.title = title
        self.tintColor = tintColor
        self.content = content()
    }
    
    public var body: some View {
        HStack {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
            Spacer()
            content
        }
    }
}

#Preview {
    RowView(imageName: "gear",
            title: "Version",
            tintColor: Color(.systemGray))
    {
        Text("1.0.0")
        .font(.subheadline)
            .foregroundStyle(Color.gray)
    }
}
