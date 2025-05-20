//
//  BinanceKlineResponse.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 20.05.2025.
//
import Foundation

struct BinanceKlineResponse: Decodable{
    let openTime: Int
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Double
    let closeTime: Int
    let quoteAssetVolume: Double
    let numberOfTrades: Int
    let takerBuyBaseAssetVolume: Double
    let takerBuyQuoteAssetVolume: Double
    let ignore: Double


    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        openTime = try container.decode(Int.self)
        open = try Double(container.decode(String.self))!
        high = try Double(container.decode(String.self))!
        low = try Double(container.decode(String.self))!
        close = try Double(container.decode(String.self))!
        volume = try Double(container.decode(String.self))!
        closeTime = try container.decode(Int.self)
        quoteAssetVolume = try Double(container.decode(String.self))!
        numberOfTrades = try container.decode(Int.self)
        takerBuyBaseAssetVolume = try Double(container.decode(String.self))!
        takerBuyQuoteAssetVolume = try Double(container.decode(String.self))!
        ignore = try Double(container.decode(String.self))!
    }
    
    var asKline: Kline {
        let date = Date(timeIntervalSince1970: TimeInterval(openTime) / 1000.0)
        return Kline(time: date, open: open, high: high, low: low, close: close, volume: volume)
    }
}
