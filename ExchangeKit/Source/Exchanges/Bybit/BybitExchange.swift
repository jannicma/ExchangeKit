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
            let response: BybitTimeResponse = try await client.get(endpoint: endpoint, parameters: [:])
            return response.retCode == 0
        } catch {
            return false
        }
    }
    
    public func GetKline(baseCurrency: String, quoteCurrency: String, interval: KlineInterval, limit: Int) async throws -> [Kline] {
        let endpoint = "/v5/market/kline"
        let parameters = ["symbol": "\(baseCurrency)\(quoteCurrency)",
                          "interval": interval.bybit,
                          "limit": "\(limit)"]

        do{
            let bybitKlines: BybitKlineResponse = try await client.get(endpoint: endpoint, parameters: parameters)
            return bybitKlines.result.list.map { $0.asKline }
        }
        catch {
            throw error
        }
    }
}
