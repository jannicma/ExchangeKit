//
//  BybitExchange.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//
import Foundation

public class BybitExchange: Exchange {
    public let name: String = "Bybit"
    private let client: ExchangeClient
    
    public init(apiKey: String, apiSecret: String) {
        let bybitBaseUrl = URL(string: "url")!
        self.client = ExchangeClient(baseURL: bybitBaseUrl, apiKey: apiKey, apiSecret: apiSecret)
    }

    
    public func TestConnection() async -> Bool {
        return true
    }
}
