//
//  BinanceExchangeTests.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

import Testing
@testable import ExchangeKit

struct BinanceTests {

    @Test func BinanceSpecificData() async throws {
        let binance = BinanceExchange(apiKey: "", apiSecret: "")
        #expect(binance.exchange.rawValue == "Binance")
    }

}
