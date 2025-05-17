//
//  ExchangeClient.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//
import Foundation

public class ExchangeClient {
    private let baseURL: String
    private let apiKey: String?
    private let apiSecret: String?
    
    init(baseURL: String, apiKey: String? = nil, apiSecret: String? = nil) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }
    
    func get<T: Decodable> (endpoint: String, parameters: [String: String]) async throws -> T {
        return "" as! T
    }
}
