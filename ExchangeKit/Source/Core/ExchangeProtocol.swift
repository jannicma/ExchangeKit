//
//  ExchangeProtocol.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

public protocol ExchangeProtocol{
    var exchange: Exchange { get }
    func TestConnection() async -> Bool
    func GetKline(baseCurrency: String, quoteCurrency: String, interval: KlineInterval, limit: Int) async throws -> [Kline]
    func GetAllFundingRates() async throws -> [FundingRate]
    func GetFundingRate(baseCurrency: String, quoteCurrency: String) async throws -> FundingRate
}
