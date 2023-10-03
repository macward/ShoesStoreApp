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

struct Product: Identifiable {
    var id: UUID = UUID()
    var image: String
}

struct HomeScreen: View {
    
    @State private var path = NavigationPath()
    
    @State private var header: [HeaderItem] = [
        .init(imageName: "nike_3"),
        .init(imageName: "nike_1"),
        .init(imageName: "nike_3"),
        .init(imageName: "puma_3"),
        .init(imageName: "adidas_1"),
        .init(imageName: "puma_4"),
        .init(imageName: "puma_1")
    ]
    
    @State private var allProducts: [Product] = [
        .init(image: "nike_1"),
        .init(image: "nike_2"),
        .init(image: "nike_3"),
        .init(image: "nike_4"),
        .init(image: "puma_1"),
        .init(image: "puma_2"),
        .init(image: "adidas_1"),
        .init(image: "puma_3"),
        .init(image: "adidas_3"),
        .init(image: "puma_4")
    ]
    
    
    @State private var brands: [String] = [
        "adidas","asics", "converse", "nike",
        "reebok", "topper", "under-armour"
    ]
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    MainSliderView(data: $header) { $slider in
                        // overlay image
                        Image(slider.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(.degrees(45))
                            .scaleEffect(1.4)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .offset(x: -54, y: -10)
                            .shadow(color: .black.opacity(0.7), radius: 12, x: 2, y: 2)
                            .visualEffect { content, geometryProxy in
                                content.offset(x: scrollOffset(geometryProxy))
                            }
                    }
                    
                    // second
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(brands, id: \.self) { brand in
                                
                                ZStack {
                                    Color.grayLite
                                    Image(brand)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.all, 32)
                                        
                                }
                                .clipShape(Circle())
                                .containerRelativeFrame(.horizontal, count: 4, spacing: 0)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(16, for: .automatic)
                    .scrollTargetBehavior(.viewAligned)
                    .offset(y: -24)
                    
                    
                    
                    VStack {
                        SectionHeaderAction(title: "Popular", callback: {
                            print("see more pressed")
                            path.append("Popular")
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
                                                .rotationEffect(.degrees(35))
                                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                                .scaleEffect(1.4)
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
                    
                    // all prods
                    
                    VStack {
                        SectionHeaderAction(title: "Newest shoes", callback: {
                            path.append("Newest shoes")
                        })
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 20) {
                            ForEach(allProducts) { product in
                                ShoeCardView(product: product)
                            }
                        }
                    
                    }
                    .padding(.horizontal)
                    .navigationDestination(for: String.self) { textValue in
                        ListOfShoesScreen(text: textValue, path: $path)
                    }
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
