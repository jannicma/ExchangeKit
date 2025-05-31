//
//  BinanceExchange.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//
import Foundation

public class BinanceExchange: ExchangeProtocol {
    public let exchange: Exchange = Exchange.Binance
    private let client: ExchangeClient
    
    public init(apiKey: String, apiSecret: String) {
        let binanceBaseUrl = URL(string: exchange.baseUrl)!
        self.client = ExchangeClient(baseURL: binanceBaseUrl, apiKey: apiKey, apiSecret: apiSecret)
    }

    
    public func TestConnection() async -> Bool {
        let endpoint = "/fapi/v1/ping"
        do {
            let _: BinancePingResponse = try await client.get(endpoint: endpoint, parameters: [:])
            return true
        } catch {
            return false
        }
    }
    
    public func GetKline(baseCurrency: String, quoteCurrency: String, interval: KlineInterval, limit: Int) async throws -> [Kline] {
        let endpoint = "/fapi/v1/klines"
        let parameters = ["symbol": "\(baseCurrency)\(quoteCurrency)",
                          "interval": interval.binance,
                          "limit": "\(limit)"]
        
        do{
            let binanceKlines: [BinanceKlineResponse] = try await client.get(endpoint: endpoint, parameters: parameters)
            return binanceKlines.map { $0.asKline }
        } catch {
            throw error
        }
    }

    public func GetAllFundingRates() async throws -> [FundingRate] {
        //there is no endpoint to get all the funding rates
        return []
    }
}
