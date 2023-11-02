//
//  API.swift
//  ShoeStoreWithRedux
//
//  Created by Max Ward on 13/10/2023.
//

import Foundation
import Combine

public enum DispatcherError: Error {
    case noData
    case invalidResponse
    case badRequest(String?)
    case serverError(String?)
    case parseError(String?)
    case unknown
}

public enum RuntimeApiError: String {
    case noUrlFound = "(error 101 - No url found)"
    case urlNotProvided = "error 102 - Url not provided"
    case notValidUrlFormat = "(error 103 - Not valid url format)"
}


public extension HTTPURLResponse {
    var isOk: Bool {
        return 200...299 ~= self.statusCode
    }
}

extension URLResponse {
    var httpResponse: HTTPURLResponse? {
        return self as? HTTPURLResponse
    }
}

class API {
    static func get<T: Codable>(_ url: String, of type: T.Type) async throws -> T {
        guard let url = URL(string: url) else { fatalError() }
        let (data, response) = try await  URLSession.shared.data(from: url)
        guard let response = response.httpResponse, response.isOk else {
            throw DispatcherError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    static func getCombine<T: Codable>(_ url: String, of type: T.Type) -> some Publisher<T, Error> {
        let endpoint = URL(string: url)!
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
    }
}

extension Product {
    static func get(_ url: String) async -> [Product] {
        do {
            let data = try await API.get(url, of: HomeDto.self)
            let products = data.products.map({Product(image: $0.image, isFeatured: $0.featured, isTop: $0.top )})
            return products
        } catch (let error) {
            // handle error
            print(error.localizedDescription)
            return []
        }
    }
}
