//
//  BybitExchange.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//
import Foundation

public class BybitExchange: ExchangeProtocol {
    public let exchange: Exchange = Exchange.Bybit
    private let client: ExchangeClient
    
    public init(apiKey: String, apiSecret: String) {
        let bybitBaseUrl = URL(string: exchange.baseUrl)!
        self.client = ExchangeClient(baseURL: bybitBaseUrl, apiKey: apiKey, apiSecret: apiSecret)
    }

    
    public func TestConnection() async -> Bool {
        let endpoint = "/v5/market/time"
        do {
            let _: BybitTimeResponse = try await client.get(endpoint: endpoint, parameters: [:])
            return true
        } catch {
            return false
        }
    }
}
