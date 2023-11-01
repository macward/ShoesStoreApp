//
//  ShoppingCartScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 01/11/2023.
//

import SwiftUI

struct ShoppingCartScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        VStack {
                            HStack {
                                Image("nike_1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 10)
                                    .padding(.all, 4)
                                    .background(
                                        Color.gray.opacity(0.3).mask(RoundedRectangle(cornerRadius: 10))
                                    )
                                VStack (alignment: .leading) {
                                    Text("Nike Shoe III")
                                        .font(.headline)
                                    Text("Brand: Nike")
                                        .font(.caption)
                                    Spacer()
                                }
                                Spacer()
                                VStack (alignment: .trailing) {
                                    Text("1 x 120.99")
                                        .font(.caption2)
                                    Text("$120.99")
                                        .font(.headline)
                                }
                            }
                        }
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .stroke(Color.gray.opacity(0.3))
                            .frame(height: 1)
                    }
                    
                    VStack {
                        VStack {
                            HStack {
                                Image("nike_2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 10)
                                    .padding(.all, 4)
                                    .background(
                                        Color.gray.opacity(0.3).mask(RoundedRectangle(cornerRadius: 10))
                                    )
                                VStack (alignment: .leading) {
                                    Text("Nike Shoe III")
                                        .font(.headline)
                                    Text("Brand: Nike")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack (alignment: .trailing) {
                                    Spacer()
                                    Text("$120.99")
                                        .font(.headline)
                                    Text("1 x 120.99")
                                        .font(.caption2)
                                }
                            }
                        }
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .stroke(Color.gray.opacity(0.3))
                            .frame(height: 1)
                    }
                    
                    VStack {
                        VStack {
                            HStack {
                                Image("nike_3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 10)
                                    .padding(.all, 4)
                                    .background(
                                        Color.gray.opacity(0.3).mask(RoundedRectangle(cornerRadius: 10))
                                    )
                                VStack (alignment: .leading) {
                                    Text("Nike Shoe III")
                                        .font(.headline)
                                    Text("Brand: Nike")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack (alignment: .trailing) {
                                    Spacer()
                                    Text("$120.99")
                                        .font(.headline)
                                    Text("1 x 120.99")
                                        .font(.caption2)
                                }
                            }
                        }
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .stroke(Color.gray.opacity(0.3))
                            .frame(height: 1)
                    }
                    
                    VStack {
                        HStack {
                            Text("Subtotal")
                            Spacer()
                            Text("$2104.99")
                        }
                        HStack {
                            Text("Shipping")
                            Spacer()
                            Text("$7.99")
                        }
                        HStack {
                            Text("Subtotal")
                            Spacer()
                            Text("$2114.99")
                        }
                    }
                    .padding(.top, 24)
                }
                .padding(.horizontal)
                .padding(.top)
                .navigationTitle("Shopping cart")
                
                Button {
                    print("")
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
        }
    }
}

#Preview {
    NavigationStack {
        ShoppingCartScreen()
            .navigationTitle("Shopping cart")
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
