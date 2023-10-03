//
//  HomeScreen.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 02/10/2023.
//

import SwiftUI

struct HeaderItem: Identifiable {
    var id: UUID = UUID()
    var imageName: String
}

struct HomeScreen: View {
    
    @State private var path = NavigationPath()
    
    @State private var header: [HeaderItem] = [
        .init(imageName: "shoe_yellow"),
        .init(imageName: "shoe_yeezy boost"),
        .init(imageName: "shoe_red"),
        .init(imageName: "shoe_pink")
    ]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(header) { item in
                            HeaderCardView {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(-45))
                                    .scaleEffect(1.2)
                                    .offset(x: -24, y: -10)
                                    .shadow(color: .black.opacity(0.7), radius: 12, x: 2, y: 2)
                                    .visualEffect { content, geometryProxy in
                                        content.offset(x: scrollOffset(geometryProxy))
                                    }
                            }
                            .scrollTransition{ content, phase in
                                content
                                    .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                                 y: phase.isIdentity ? 1 : 0.8)
                                    .offset(x: phase.isIdentity ? 0 : -30)
                            }
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        }
                    }
                    .padding(.top)
                    .contentMargins(16, for: .scrollContent)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .contentMargins(16, for: .scrollContent)
                
                VStack {
                    SectionHeaderAction(title: "Popular", callback: {
                        print("see more pressed")
                        path.append("GGG")
                    })
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(header) { item in
                                GeometryReader(content: { geometry in
                                    HStack (spacing: 32) {
                                        VStack (alignment: .leading, spacing: 30) {
                                            Image("justdoitnike")
                                                
                                            Text("Explore Now >")
                                                .font(.title3.bold())
                                                .foregroundStyle(Color.white)
                                        }
                                        .padding(.leading, 32)
                                        Spacer()
                                    }
                                    .frame(height: 160)
                                    .background(Color.grayLite.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .scrollTransition{ content, phase in
                                        content
                                            .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                                         y: phase.isIdentity ? 1 : 0.8)
                                    }
                                    .overlay {
                                        Image(item.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .rotationEffect(.degrees(-35))
                                            .scaleEffect(1.2)
                                            .offset(x: 40, y: -10)
                                            .visualEffect { content, geometryProxy in
                                                content.offset(x: scrollOffset(geometryProxy))
                                            }
                                            .shadow(color: .black.opacity(0.6), radius: 6, x: 4, y: 0)
                                    }
                                })
                                .frame(width: 300, height: 160)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(16, for: .scrollContent)
                }
                
                VStack {
                    SectionHeaderAction(title: "Newest shoes", callback: {
                        print("see more pressed")
                    })
                    
                    LazyVGrid(columns: gridItemLayout, spacing: 20) {
                        ForEach((0...5), id: \.self) { _ in
                            ShoeCardView()
                        }
                    }
                
                }
                .padding(.horizontal)
                .navigationDestination(for: String.self) { textValue in
                    ListOfShoesScreen(text: textValue, path: path)
                }
                
            }
        }
    }
    
    func scrollOffset(_ phase: GeometryProxy) -> CGFloat {
        let titleScrollSpeed: CGFloat = 0.3
        let minX = phase.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}

#Preview {
    HomeScreen()
}
