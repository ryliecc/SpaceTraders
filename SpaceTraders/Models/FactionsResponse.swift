//
//  FactionsResponse.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 25.06.25.
//

import Foundation

struct FactionsResponse: Codable {
    let data: FactionsData
    let meta: FactionsMeta
}

struct FactionsData: Codable {
    let symbol: String
    let reputation: Int
}

struct FactionsMeta: Codable {
    let total: Int
    let page: Int
    let limit: Int
}
