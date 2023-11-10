//
//  HomeModel.swift
//  Shoe Store
//
//  Created by Max Ward on 07/11/2023.
//

import Foundation
import DataLayer
import Services
import Combine

public class HomeModel: ObservableObject {
    
    @Published public var products: [Product] = []
    @Published public var featured: [Product] = []
    @Published public var popular: [Product] = []
    @Published public var isLoading: Bool = false
    
    // this should not be here
    private var buildUrl: String {
        return "\(BASE_URL)products"
    }
    
    // MARK: Private properties
    private var repository: any ProductRepository
    private var subscriptions = Set<AnyCancellable>()
    private var appManager: GlobalDataManager?
    
    // MARK: Publishers
    private var favouritesPublisher: AnyPublisher<[Product], Never> {
        $products
            .map { products in
                products.filter { product in
                    product.isFav == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    public var popularProductsPublisher: AnyPublisher<[Product], Never> {
        $products
            .map { products in
                products.filter { product in
                    product.isTop == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    public var featuredProductsPublisher: AnyPublisher<[Product], Never> {
        $products
            .map { products in
                products.filter { product in
                    product.isFeatured == true
                }
            }
            .eraseToAnyPublisher()
    }
    
    public init(repository: any ProductRepository) {
        self.repository = repository
    }
    
    func subscribers() {
        favouritesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                self?.appManager?.favourites = products
            }
            .store(in: &subscriptions)
        
        featuredProductsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$featured)
        
        popularProductsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$popular)
    }
    
    func configure(_ appManager: GlobalDataManager) {
        self.appManager = appManager
        self.subscribers()
    }
    
    @MainActor
    func loadData() async {
        do {
            isLoading.turnOn()
            let result = try await repository.getAll() as! [Product]
            products = result
            isLoading.turnOff()
        } catch (let error){
            print(error.localizedDescription)
        }
    }
    
    // MARK: Methods
    public func handleFavourites(_ product: Product) {
        guard let index = products.firstIndex (where: { $0.id == product.id }) else { return }
        products[index].isFav.toggle()
    }
}
