//
//  BybitTickersResponse.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 30.05.2025.
//
import Foundation

struct BybitTickersResponse: Codable {
    let retCode: Int
    let retMsg: String
    let result: Result
    let retExtInfo: RetExtInfo
    let time: Int
    
    
    struct Result: Codable {
        let category: String
        let list: [MarketData]
        
        struct MarketData: Codable {
            let symbol: String
            let lastPrice: Double
            let indexPrice: Double
            let markPrice: Double
            let prevPrice24h: Double
            let price24hPcnt: Double
            let highPrice24h: Double
            let lowPrice24h: Double
            let prevPrice1h: Double
            let openInterest: Double
            let openInterestValue: Double
            let turnover24h: Double
            let volume24h: Double
            let fundingRate: Double
            let nextFundingTime: Int
            let predictedDeliveryPrice: String
            let basisRate: String
            let deliveryFeeRate: String
            let deliveryTime: Int
            let ask1Size: Double
            let bid1Price: Double
            let ask1Price: Double
            let bid1Size: Double
            let basis: String
            let preOpenPrice: String
            let preQty: String
            let curPreListingPhase: String
            
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)

                self.symbol = try container.decode(String.self, forKey: .symbol)
                self.lastPrice = try Double(container.decode(String.self, forKey: .lastPrice)) ?? 0.0
                self.indexPrice = try Double(container.decode(String.self, forKey: .indexPrice)) ?? 0.0
                self.markPrice = try Double(container.decode(String.self, forKey: .markPrice)) ?? 0.0
                self.prevPrice24h = try Double(container.decode(String.self, forKey: .prevPrice24h)) ?? 0.0
                self.price24hPcnt = try Double(container.decode(String.self, forKey: .price24hPcnt)) ?? 0.0
                self.highPrice24h = try Double(container.decode(String.self, forKey: .highPrice24h)) ?? 0.0
                self.lowPrice24h = try Double(container.decode(String.self, forKey: .lowPrice24h)) ?? 0.0
                self.prevPrice1h = try Double(container.decode(String.self, forKey: .prevPrice1h)) ?? 0.0
                self.openInterest = try Double(container.decode(String.self, forKey: .openInterest)) ?? 0.0
                self.openInterestValue = try Double(container.decode(String.self, forKey: .openInterestValue)) ?? 0.0
                self.turnover24h = try Double(container.decode(String.self, forKey: .turnover24h)) ?? 0.0
                self.volume24h = try Double(container.decode(String.self, forKey: .volume24h)) ?? 0.0
                self.fundingRate = try Double(container.decode(String.self, forKey: .fundingRate)) ?? 0.0
                self.nextFundingTime = try Int(container.decode(String.self, forKey: .nextFundingTime)) ?? 0
                self.predictedDeliveryPrice = try container.decode(String.self, forKey: .predictedDeliveryPrice)
                self.basisRate = try container.decode(String.self, forKey: .basisRate)
                self.deliveryFeeRate = try container.decode(String.self, forKey: .deliveryFeeRate)
                self.deliveryTime = try Int(container.decode(String.self, forKey: .deliveryTime)) ?? 0
                self.ask1Size = try Double(container.decode(String.self, forKey: .ask1Size)) ?? 0.0
                self.bid1Price = try Double(container.decode(String.self, forKey: .bid1Price)) ?? 0.0
                self.ask1Price = try Double(container.decode(String.self, forKey: .ask1Price)) ?? 0.0
                self.bid1Size = try Double(container.decode(String.self, forKey: .bid1Size)) ?? 0.0
                self.basis = try container.decode(String.self, forKey: .basis)
                self.preOpenPrice = try container.decode(String.self, forKey: .preOpenPrice)
                self.preQty = try container.decode(String.self, forKey: .preQty)
                self.curPreListingPhase = try container.decode(String.self, forKey: .curPreListingPhase)
            }

            var asFundingRate: FundingRate {
                return FundingRate(symbol: self.symbol, price: self.lastPrice, fundingRate: self.fundingRate, nextFundingTime: self.nextFundingTime )
            }

        }

    }
    
    
    struct RetExtInfo: Codable {
    }


}










/*
 
 {"symbol":"1000000BABYDOGEUSDT","lastPrice":"0.0013993","indexPrice":"0.0014003","markPrice":"0.0013993","prevPrice24h":"0.0016152","price24hPcnt":"-0.133667","highPrice24h":"0.0016224","lowPrice24h":"0.0013798","prevPrice1h":"0.0014065","openInterest":"2177940100","openInterestValue":"3047591.58","turnover24h":"3943096.6817","volume24h":"2656251300.0000","fundingRate":"0.00005","nextFundingTime":"1748635200000","predictedDeliveryPrice":"","basisRate":"","deliveryFeeRate":"","deliveryTime":"0","ask1Size":"400","bid1Price":"0.0013992","ask1Price":"0.0013994","bid1Size":"8300","basis":"","preOpenPrice":"","preQty":"","curPreListingPhase":""},{"symbol":"1000000CHEEMSUSDT","lastPrice":"1.5127","indexPrice":"1.5118","markPrice":"1.5127","prevPrice24h":"1.5564","price24hPcnt":"-0.028077","highPrice24h":"1.5813","lowPrice24h":"1.4771","prevPrice1h":"1.5191","openInterest":"888802","openInterestValue":"1344490.79","turnover24h":"860603.9573","volume24h":"561626.0000","fundingRate":"0.00005","nextFundingTime":"1748635200000","predictedDeliveryPrice":"","basisRate":"","deliveryFeeRate":"","deliveryTime":"0","ask1Size":"12","bid1Price":"1.5124","ask1Price":"1.5126","bid1Size":"195","basis":"","preOpenPrice":"","preQty":"","curPreListingPhase":""}
 
 
 */
