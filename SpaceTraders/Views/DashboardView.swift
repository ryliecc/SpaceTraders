//
//  DashboardView.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 24.06.25.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var agentViewModel: AgentViewModel
    
    var body: some View {
        VStack {
            Text("Agent name: \(agentViewModel.agent?.symbol ?? "")")
            Text("Faction: \(agentViewModel.agent?.startingFaction ?? "")")
            Text("Credits: \(agentViewModel.agent?.credits ?? 0)")
            Text("Headquarter: \(agentViewModel.agent?.startingFaction ?? "")")
        }
    }
}

#Preview {
    DashboardView(agentViewModel: .init())
}
