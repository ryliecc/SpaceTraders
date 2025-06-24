//
//  AgentViewModel.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 24.06.25.
//

import Foundation

@MainActor
class AgentViewModel: ObservableObject {
    @Published var agent: AgentData = AgentData.placeholder()
    @Published var isLoaded: Bool = false
    
    func fetch() async -> Bool {
            do {
                agent = try await SpaceTradersApi.shared.getAgent()
                isLoaded = true
                return true
            } catch let error as HTTPError {
                print(error.message)
            } catch {
                print(error)
            }
        return false
    }
}
