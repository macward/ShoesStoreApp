//
//  SwiftUIView.swift
//  
//
//  Created by Max Ward on 24/11/2023.
//

import SwiftUI
import Domain

public struct AccountScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: []
    ) var products: FetchedResults<Product>
    
    @FetchRequest(
        sortDescriptors: []
    ) var orders: FetchedResults<Order>
    
    
    public init() {}
    public var body: some View {
        List {
            Section {
                HStack {
                    Text("MW")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                    .mask(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Max Ward")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("max.ward@gmail.com")
                            .font(.footnote)
                            .tint(.gray)
                    }
                }
            }
            
            Section("General") {
                RowView(imageName: "gear",
                       title: "Version",
                       tintColor: Color(.systemGray)) {
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                }
            }
            
            Section("Cache") {
                Button(action: {
                    //
                }, label: {
                    RowView(imageName: "arrow.left.circle.fill",
                           title: "Sign Out",
                           tintColor: .red,
                           content: {EmptyView()})
                })
                
                Button(action: deleteAll, label: {
                    RowView(imageName: "xmark.circle.fill",
                           title: "Delete all",
                           tintColor: .red,
                           content: {EmptyView()})
                })
            }
        }
    }
    
    private func deleteAll() {
//        orders.forEach({viewContext.delete($0)})
        products.forEach({viewContext.delete($0)})
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    AccountScreen()
}
