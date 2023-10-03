//
//  ListOfShoesScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ListOfShoesScreen: View {
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    let text: String
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((0...11), id: \.self) { _ in
                    ShoeCardView()
                }
            }
        }
        .contentMargins(16, for: .scrollContent)
        .navigationTitle(text)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    path.removeLast()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
}
//
//#Preview {
//    NavigationStack {
//        ListOfShoesScreen()
//    }
//}
