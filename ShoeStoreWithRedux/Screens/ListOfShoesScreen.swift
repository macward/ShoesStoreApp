//
//  ListOfShoesScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct ListOfShoesScreen: View {
    
    var text: String
    @Binding var path: NavigationPath
    @State var presentProductPage: Bool = false
    @Namespace var namespace
    @State var magnify: Bool = true
    
    var body: some View {
        let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((0..<10), id: \.self) { _ in
                    ProductCardView(product: .init(image: "nike_\(Int.random(in: 1...10))"))
                        .onTapGesture {
                            presentProductPage.toggle()
                        }
                }
            }
            .fullScreenCover(isPresented: $presentProductPage, content: {
                ShoeDetailView(product: .init(image: "nike_11"), namespace: namespace, magnify: .constant(true))
                EmptyView()
            })
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
