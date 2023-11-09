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
    public static func get<T: Codable>(_ request: URLRequest, of type: T.Type) async throws -> T {
        let (data, response) = try await  URLSession.shared.data(for: request)
        guard let response = response.httpResponse, response.isOk else {
            throw DispatcherError.invalidResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch (let error) {
            throw DispatcherError.parseError(error.localizedDescription)
        }
    }
}
