//
//  FactionsResponse.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 25.06.25.
//

import Foundation

struct FactionsResponse: Codable {
    let data: [FactionData]
    let meta: FactionsMeta
}

struct FactionData: Codable {
    let symbol: String
    let reputation: Int
    
    static func placeholder() -> FactionData {
        return FactionData(symbol: "LOADING", reputation: 0)
    }
}

struct FactionsMeta: Codable {
    let total: Int
    let page: Int
    let limit: Int
}
