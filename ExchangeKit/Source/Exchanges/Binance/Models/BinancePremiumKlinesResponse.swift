//
//  BinancePremiumKlinesResponse.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 15.06.2025.
//

import Foundation

struct BinancePremiumKlinesResponse: Decodable {
    let openTime: Int
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let ignore1: String
    let closeTime: Int
    let ignore2: String
    let ignore3: String
    let ignore4: String
    let ignore5: String
    let ignore6: String


    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        openTime = try container.decode(Int.self)
        open = try Double(container.decode(String.self))!
        high = try Double(container.decode(String.self))!
        low = try Double(container.decode(String.self))!
        close = try Double(container.decode(String.self))!
        ignore1 = try container.decode(String.self)
        closeTime = try container.decode(Int.self)
        ignore2 = try container.decode(String.self)
        ignore3 = try container.decode(String.self)
        ignore4 = try container.decode(String.self)
        ignore5 = try container.decode(String.self)
        ignore6 = try container.decode(String.self)
    }
}
