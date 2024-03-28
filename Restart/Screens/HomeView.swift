//
//  HomeView.swift
//  Restart
//
//  Created by Hasan on 3/28/24.
//

import SwiftUI

struct HomeView: View {
    // if the onboarding exists in the app storage, it will skip the initialization and never change the value.
    // if it does not exist it will initialize it with the value
    @AppStorage("onboarding") var isOnboardingActive : Bool = false
    var body: some View {
        VStack(spacing:20) {
            Spacer()
            // MARK: - Center
            RingsView(ringColor: .gray.opacity(0.2), forgroundImage: "character-2")
            
            Text(
            """
            The time that leads to mastery is
            dependent on the intensity of out focus.
            """
            )
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
            Spacer()
            
            // MARK: - Footer
            
            Button{
                isOnboardingActive = true
            }label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    Text("Restart")
                    .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .padding()
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.small)
            
        }
    }
}

#Preview {
    HomeView()
}
