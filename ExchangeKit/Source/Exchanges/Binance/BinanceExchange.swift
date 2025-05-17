//
//  BinanceExchange.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//
import Foundation

public class BinanceExchange: Exchange {
    public let name: String = "Binance"
    private let client: ExchangeClient
    
    public init(apiKey: String, apiSecret: String) {
        self.client = ExchangeClient(baseURL: "url", apiKey: apiKey, apiSecret: apiSecret)
    }

    
    public func TestConnection() async -> Bool {
        return true
    }
}
