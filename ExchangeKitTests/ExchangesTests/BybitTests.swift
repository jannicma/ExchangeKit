//
//  BybitTests.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

import Testing
@testable import ExchangeKit

struct BybitTests {

    @Test func BybitSpecificData() async throws {
        let bybit = BybitExchange(apiKey: "", apiSecret: "")
        #expect(bybit.name == "Bybit")
    }

}
