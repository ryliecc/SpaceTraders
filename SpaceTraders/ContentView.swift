//
//  ContentView.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 23.06.25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("firstLaunch") var firstLaunch: Bool = true

    var body: some View {
        if firstLaunch {
            OnboardingView()
        } else {
            Text("Looks like this is not your first time launching the app. More content will come soon. Stay tuned!")
        }
    }
}

#Preview {
    ContentView()
}
