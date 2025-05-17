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
        var exchanges: [Exchange] = []
        exchanges.append(BinanceExchange(apiKey: "", apiSecret: ""))
        exchanges.append(BybitExchange(apiKey: "", apiSecret: ""))
        
        #expect(exchanges.first?.name != exchanges.last?.name)
    }

}
