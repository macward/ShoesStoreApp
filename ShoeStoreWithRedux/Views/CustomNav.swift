//
//  CustomNav.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct CustomNav: ViewModifier {
    var title: String? = nil
    var parentPresentationMode: Binding<PresentationMode>? = nil
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func body(content: Content) -> some View {
        
        content
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .font(.title.bold())
                            .foregroundStyle(Color.black)
                    })
                }
                
                ToolbarItem(placement: .principal) {
                    if let title = title {
                        Text(title)
                            .font(.custom("Satoshi-Bold.otf", size: 18))
                            .fixedSize(horizontal: true, vertical: false)
                            .foregroundColor(Color.black)
                    }
                }
            })
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    public func appNavigation(title: String) -> some View {
        modifier(CustomNav(title: title))
    }
}
