//
//  AgentViewModel.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 24.06.25.
//

import Foundation

@MainActor
class AgentViewModel: ObservableObject {
    @Published var agent: AgentData?
    
    func fetch() async -> Bool {
            do {
                agent = try await SpaceTradersApi.shared.getAgent()
                return true
            } catch let error as HTTPError {
                print(error.message)
            } catch {
                print(error)
            }
        return false
    }
}
