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
    
    static func placeholder() -> AgentData {
        return AgentData(accountId: "Is loading...", symbol: "Is loading...", headquarters: "Is loading...", credits: 0, startingFaction: "Is loading...", shipCount: 0)
    }
}
