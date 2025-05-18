//
//  APIError.swift
//  ExchangeKit
//
//  Created by Jannic Marcon on 17.05.2025.
//

public enum APIError: Error {
    case networkError(Error)
    case invalidResponse
    case rateLimitExceeded
    case invalidUrl(String)
    case httpError(Int)
    case decodingError(DecodingError)
}
