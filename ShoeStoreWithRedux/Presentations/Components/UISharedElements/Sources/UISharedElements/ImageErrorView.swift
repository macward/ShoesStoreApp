//
//  ImageErrorView.swift
//  Shoe Store
//
//  Created by Max Ward on 04/11/2023.
//

import SwiftUI

public struct ImageErrorView: View {
    public var body: some View {
        VStack {
            Image(systemName: "xmark.app")
                .font(.title)
                .foregroundStyle(Color.red)
            Text("Error")
                .font(.headline)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ImageErrorView()
}
