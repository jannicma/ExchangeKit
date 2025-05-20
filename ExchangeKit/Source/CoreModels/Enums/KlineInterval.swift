//
//  KlineInterval.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 20.05.2025.
//

public enum KlineInterval: CaseIterable {
    case oneMinute
    case fiveMinutes
    case fifteenMinutes
    case thirtyMinutes
    case oneHour
    case fourHours
    case oneDay
    
    var binance: String {
        switch self {
        case .oneMinute:
            return "1m"
        case .fiveMinutes:
            return "5m"
        case .fifteenMinutes:
            return "15m"
        case .thirtyMinutes:
            return "30m"
        case .oneHour:
            return "1h"
        case .fourHours:
            return "4h"
        case .oneDay:
            return "1d"
        }
    }

    var bybit: String {
        switch self {
        case .oneMinute:
            return "1"
        case .fiveMinutes:
            return "5"
        case .fifteenMinutes:
            return "15"
        case .thirtyMinutes:
            return "30"
        case .oneHour:
            return "60"
        case .fourHours:
            return "240"
        case .oneDay:
            return "d"
        }
    }
}
