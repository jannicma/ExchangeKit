//
//  ExchangeKitTests.swift
//  ExchangeKitTests
//
//  Created by Jannic Marcon on 16.05.2025.
//

import Testing
@testable import ExchangeKit

struct ExchangeKitTests {

    @Test func MultipleExchangesSameProtocol() async throws {
        var exchanges: [ExchangeProtocol] = []
        exchanges.append(BinanceExchange(apiKey: "", apiSecret: ""))
        exchanges.append(BybitExchange(apiKey: "", apiSecret: ""))
        
        #expect(exchanges.first?.exchange.rawValue != exchanges.last?.exchange.rawValue)
    }

}
