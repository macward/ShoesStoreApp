//
//  SectionHeaderAction.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

public struct SectionHeaderAction: View {
    
    var title: String
    var callback: () -> Void
    
    public init(title: String, callback: @escaping () -> Void) {
        self.title = title
        self.callback = callback
    }
    
    public var body: some View {
        HStack {
            Text(title)
                .font(.title2.bold())
            Spacer()
            
            Button(action: callback, label: {
                Text("See more")
                    .font(.callout.bold())
                    .foregroundStyle(.gray)
            })
        }
    }
}

#Preview {
    SectionHeaderAction(title: "Popular", callback: { })
}
