//
//  ContentView.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 23.06.25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    @StateObject private var agentViewModel = AgentViewModel()

    var body: some View {
        if firstLaunch {
            OnboardingView(agentViewModel: agentViewModel)
        } else if let agent = agentViewModel.agent {
            Text("Welcome \(agent.symbol)! Looks like this is not your first time launching the app. More content will come soon. Stay tuned!")
        } else {
            ProgressView("Loading agent info…")
                .task {
                    _ = await agentViewModel.fetch()
                }
        }
    }
}

#Preview {
    ContentView()
}
