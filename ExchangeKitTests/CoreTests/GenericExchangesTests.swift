//
//  GenericExchangesTests.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

import Testing
@testable import ExchangeKit

struct GenericExchangesTests {

    @Test func TestConnection() async throws {
        var exchanges: [ExchangeProtocol] = []
        exchanges.append(BinanceExchange(apiKey: "", apiSecret: ""))
        exchanges.append(BybitExchange(apiKey: "", apiSecret: ""))
        
        for exchange in exchanges {
            let success = await exchange.TestConnection()
            #expect(success, "Connection failed for \(exchange.exchange.rawValue)")
        }
    }

}
