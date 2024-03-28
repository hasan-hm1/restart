//
//  ContentView.swift
//  Restart
//
//  Created by Hasan on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    var body: some View {
        if isOnboardingActive {
            OnboardingView()
        } else {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
