//
//  ShoppingCartScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 01/11/2023.
//

import SwiftUI
import Domain
import UISharedElements
import Combine
import ModuleAdapter
import Injector

public struct ShoppingCartScreen: View {
    
    @ObservedObject var model: ShoppingCartModel = .init()
    @State private var openCheckout: Bool = false
    
    @State private var path: NavigationPath = .init()
    @Injector(.runtime) private var adapter: CheckoutAdapter
    
    @FetchRequest(
        sortDescriptors: []
    ) var orders: FetchedResults<Order>
    
    public init() {}
    
    public var body: some View {
        NavigationStack (path: $path) {
            ScrollView {
                VStack {
                    viewSelector(isEmpty: orders.isEmpty)
                }
            }
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Shopping cart")
            .onAppear() {
                model.config(cart: orders.map{$0})
            }
            .navigationDestination(isPresented: $openCheckout, destination: {
                adapter.openCheckout()
            })
        }
    }
    
    @ViewBuilder
    func viewSelector(isEmpty: Bool) -> some View {
        if isEmpty {
            Text("No hay favoritos")
                .font(.title2.bold())
        } else {
            ScrollView {
                ForEach(orders) { order in
                    self.cartRow(order)
                }
                total(model.cart)
            }
            .padding(.horizontal)
            .padding(.top)
            checkOutButton()
        }
    }
    
    @ViewBuilder
    func checkOutButton() -> some View {
        Button {
            openCheckout.toggle()
        } label: {
            HStack {
                Spacer()
                Text("Checkout")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .padding()
                Spacer()
            }
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
        }
    }
    
    @ViewBuilder
    func total(_ orders: [Order]) -> some View {
        VStack {
            HStack {
                Text("Subtotal")
                Spacer()
                Text(String(format: "$%.2f", model.subtotal))
            }
            HStack {
                Text("Shipping")
                Spacer()
                Text(String(format: "$%.2f", model.shippingCost))
            }
            HStack {
                Text("Subtotal")
                Spacer()
                Text(String(format: "$%.2f", model.total))
            }
        }
        .padding(.top, 24)
    }
        
    @ViewBuilder
    func cartRow(_ order: Order) -> some View {
        VStack {
            VStack {
                HStack {
                    AsyncImageCached(url: order.toProduct.imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .shadow(radius: 10)
                            .padding(.all, 4)
                            .background(
                                Color.gray.opacity(0.3).mask(RoundedRectangle(cornerRadius: 10))
                            )
                    }
                    
                    VStack (alignment: .leading) {
                        Text(order.toProduct.title ?? "")
                            .font(.headline)
                        Text("Brand: Nike")
                            .font(.caption)
                        Spacer()
                    }
                    Spacer()
                    VStack (alignment: .trailing) {
                        Text((String(format: "1 x $%.2f", order.toProduct.price)))
                            .font(.caption2)
                        Text((String(format: "$%.2f", order.toProduct.price)))
                            .font(.headline)
                    }
                }
            }
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .stroke(Color.gray.opacity(0.3))
                .frame(height: 1)
        }
    }
    
}

//#Preview {
//    NavigationStack {
//        ShoppingCartScreen()
//            .navigationTitle("Shopping cart")
//            .navigationBarTitleDisplayMode(.inline)
//            .environmentObject(GlobalDataManager())
//    }
//}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
