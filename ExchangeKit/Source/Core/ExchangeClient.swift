//
//  ExchangeClient.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//
import Foundation

public class ExchangeClient {
    private let baseURL: URL
    private let apiKey: String?
    private let apiSecret: String?
    
    init(baseURL: URL, apiKey: String? = nil, apiSecret: String? = nil) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }
    
    func get<T: Decodable> (endpoint: String, parameters: [String: String]) async throws -> T {
        guard let url = URL(string: endpoint, relativeTo: baseURL) else{
            throw APIError.invalidUrl(endpoint)
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let finalURL = components?.url else {
            throw APIError.invalidUrl(endpoint)
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: finalURL)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.httpError(-1)
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                throw APIError.httpError(httpResponse.statusCode)
            }
            
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            
            return result
            
        } catch {
            if let urlError = error as? URLError {
                throw APIError.networkError(urlError)
            } else if let decodingError = error as? DecodingError {
                throw APIError.decodingError(decodingError)
            } else {
                throw error
            }
        }

    }
}
