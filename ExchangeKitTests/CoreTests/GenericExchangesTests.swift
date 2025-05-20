//
//  GenericExchangesTests.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

import Testing
@testable import ExchangeKit

struct GenericExchangesTests {
    func helper_getAllExchanges() -> [ExchangeProtocol] {
        var exchanges: [ExchangeProtocol] = []
        exchanges.append(BinanceExchange(apiKey: "", apiSecret: ""))
        exchanges.append(BybitExchange(apiKey: "", apiSecret: ""))
        return exchanges
    }
    
    @Test func TestConnection() async throws {
        let exchanges = helper_getAllExchanges()
        
        for exchange in exchanges {
            let success = await exchange.TestConnection()
            #expect(success, "Connection failed for \(exchange.exchange.rawValue)")
        }
    }
    
    @Test func GetKline() async throws {
        let exchanges = helper_getAllExchanges()
        
        for exchange in exchanges {
            let candles: [Kline] = try await exchange.GetKline(baseCurrency: "BTC", quoteCurrency: "USDT", interval: .fiveMinutes, limit: 10)
            
            #expect(candles.count == 10, "Not returned 10 candles for \(exchange.exchange.rawValue)")
            #expect(candles.last!.close > 0, "Last price is <= 0 for \(exchange.exchange.rawValue)")
        }
    }

}
