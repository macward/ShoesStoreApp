//
//  ProductListScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI
import Domain
import UISharedElements
//import Data

internal struct ProductListScreen: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.id, ascending: true)],
        animation: .default)
    private var productos: FetchedResults<Product>
    
    @State private var openDetailScreen: Bool = false
    @State private var selectedProduct: Product?
    @Binding private var path: NavigationPath
    var title: String
    
    internal init(title: String, path: Binding<NavigationPath>) {
        self.title = title
        self._path = path
    }
    
    internal var body: some View {
        ScrollView {
            ProductsGridComponent(path: $path)
            
        }
        .contentMargins(16, for: .scrollContent)
        .navigationTitle(title)
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
        .onAppear() {
            print(productos.count)
        }
    }
}


