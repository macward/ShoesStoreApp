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
