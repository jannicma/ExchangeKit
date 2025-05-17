//
//  ExchangeProtocol.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

public protocol Exchange{
    var name: String { get }
    func TestConnection() async -> Bool
}
