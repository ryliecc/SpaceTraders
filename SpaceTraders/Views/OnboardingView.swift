//
//  OnboardingView.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 23.06.25.
//

import SwiftUI

struct OnboardingView: View {
    @State var currentPage: Int = 0
    @AppStorage("key") var key: String = ""
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    @ObservedObject var agentViewModel: AgentViewModel
    @State var fetchFailed: Bool = false

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                VStack {
                    Text("Welcome to SpaceTraders!")
                    Text(
                        "This app requires an API token from the official SpaceTraders API. Please visit my.spacetraders.io to generate your personal token."
                    )
                }
                .tag(0)
                VStack {
                    Text("Please enter your API Key.")
                    TextField("Key", text: $key)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    if fetchFailed {
                        Text("Your token is invalid. Please try again.")
                            .foregroundStyle(.red)
                    }

                }
                .tag(1)
                VStack {
                    ProgressView("Trying to load data...")
                }
                .tag(2)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            HStack {
                if currentPage >= 1 {
                    Button("Back") {
                        currentPage -= 1
                    }
                }
                Spacer()
                Button("Continue") {
                    currentPage += 1
                    if currentPage == 2 {
                        Task {
                            try? await Task.sleep(nanoseconds: 1_500_000_000)
                            let success = await agentViewModel.fetch()
                            if success {
                                currentPage = 3
                                fetchFailed = false
                                firstLaunch = false
                            } else {
                                key = ""
                                fetchFailed = true
                                currentPage = 1
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .padding()
    }
}

#Preview {
    OnboardingView(agentViewModel: AgentViewModel())
}
