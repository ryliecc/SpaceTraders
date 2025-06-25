//
//  FactionsViewModel.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 25.06.25.
//

import Foundation

@MainActor
class FactionsViewModel: ObservableObject {
    @Published var factions: [FactionData] = [FactionData.placeholder()]
    @Published var isLoaded: Bool = false
    
    func fetch() async -> Bool {
        do {
            factions = try await SpaceTradersApi.shared.getFactions()
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
