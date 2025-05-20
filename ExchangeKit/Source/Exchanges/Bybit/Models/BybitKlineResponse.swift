//
//  BybitKlineResponse.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 20.05.2025.
//

import Foundation

struct BybitKlineResponse: Decodable {
    let retCode: Int
    let retMsg: String
    let result: NewResultData
    let retExtInfo: NewRetExtInfo
    let time: Int
    
    struct NewResultData: Decodable {
        let symbol: String
        let category: String
        let list: [KlineData]
    }

    struct KlineData: Decodable {
        let time: Int
        let open: Double
        let high: Double
        let low: Double
        let close: Double
        let volume: Double
        let quoteAssetVolume: Double

        init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()

            time = try Int(container.decode(String.self))!
            open = try Double(container.decode(String.self))!
            high = try Double(container.decode(String.self))!
            low = try Double(container.decode(String.self))!
            close = try Double(container.decode(String.self))!
            volume = try Double(container.decode(String.self))!
            quoteAssetVolume = try Double(container.decode(String.self))!
        }
        
        var asKline: Kline {
            let date = Date(timeIntervalSince1970: TimeInterval(time) / 1000.0)
            return Kline(time: date, open: open, high: high, low: low, close: close, volume: volume)
        }
    }

    struct NewRetExtInfo: Decodable { }

}
