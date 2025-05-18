//
//  Exchanges.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 18.05.2025.
//

public enum Exchange: String, CaseIterable {
    case Binance = "Binance"
    case Bybit = "Bybit"
    
    var baseUrl: String {
        switch self {
        case .Binance:
            return "https://fapi.binance.com"
        case .Bybit:
            return "https://api.bybit.com"
        }
    }
}
