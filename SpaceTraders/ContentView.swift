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
        } else if agentViewModel.isLoaded {
            TabView {
                Tab("Dashboard", systemImage: "house") {
                    DashboardView(agentViewModel: agentViewModel)
                }
                Tab("Fleet", systemImage: "airplane") {
                    Text("You will see your fleet here soon.")
                }
                Tab("Trade", systemImage: "cart") {
                    Text("You will find the marketplace here soon.")
                }
                Tab("Navigation", systemImage: "map") {
                    Text("You will find the navigation here soon.")
                }
                Tab("Contracts", systemImage: "doc.plaintext") {
                    Text("You will find your contracts here soon.")
                }
            }
        } else {
            ProgressView("Loading info…")
                .task {
                    _ = await agentViewModel.fetch()
                }
        }
    }
}

#Preview {
    ContentView()
}
