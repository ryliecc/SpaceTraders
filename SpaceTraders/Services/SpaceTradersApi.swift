//
//  SpaceTradersApi.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 24.06.25.
//

import Foundation

class SpaceTradersApi {
    private var key: String {
        UserDefaults.standard.string(forKey: "key") ?? ""
    }
    
    static let shared = SpaceTradersApi()
    init() {}
    
    private let baseUrl = "https://api.spacetraders.io/v2"
    
    func getAgent() async throws -> AgentData {
        guard let url = URL(string: baseUrl + "/my/agent") else {
            throw HTTPError.invalidURL
        }
        
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(key)"
        ]
        
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(AgentResponse.self, from: data)
        return result.data
    }
    
    func getFactions() async throws -> FactionsData {
        guard let url = URL(string: baseUrl + "/my/factions") else {
            throw HTTPError.invalidURL
        }
        
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(key)"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(FactionsResponse.self, from: data)
        return result.data
    }
}
