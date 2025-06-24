//
//  AgentResponse.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 24.06.25.
//

import Foundation

struct AgentResponse: Codable {
    let data: AgentData
}

struct AgentData: Codable {
    let accountId: String
    let symbol: String
    let headquarters: String
    let credits: Int
    let startingFaction: String
    let shipCount: Int
}
