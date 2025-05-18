//
//  BybitTimeResponse.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 18.05.2025.
//

struct BybitTimeResponse: Decodable {
    let retCode: Int
    let retMsg: String
    let result: ResultData
    let retExtInfo: RetExtInfo
    let time: Int
    
    
    struct ResultData: Decodable {
        let timeSecond: String
        let timeNano: String
    }
    
    struct RetExtInfo: Decodable { }
}



