// The Swift Programming Language
// https://docs.swift.org/swift-book

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

public class API {
    
    public static func get<T: Codable>(_ url: URL, of type: T.Type) async throws -> T {
        let (data, response) = try await  URLSession.shared.data(from: url)
        guard let response = response.httpResponse, response.isOk else {
            throw DispatcherError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public static func getCombine<T: Codable>(_ url: String, of type: T.Type) -> some Publisher<T, Error> {
        let endpoint = URL(string: url)!
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
    }
}
