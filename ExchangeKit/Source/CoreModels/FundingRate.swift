//
//  FundingFee.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 30.05.2025.
//
import Foundation

public struct FundingRate: Decodable{
    var symbol: String
    var price: Double
    var fundingRate: Double
    var nextFundingTime: Int
}
