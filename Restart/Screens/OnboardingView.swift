//
//  OnboardingView.swift
//  Restart
//
//  Created by Hasan on 3/28/24.
//

import SwiftUI

struct OnboardingView: View {
    // if the onboarding exists in the app storage, it will skip the initialization and never change the value.
    // if it does not exist it will initialize it with the value
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat = 0
    var body: some View {
        ZStack{
            Color(.colorBlue)
                .ignoresSafeArea()
            
            VStack(spacing:20){
                // MARK: - Header
                VStack(){
                    Text("Share.")
                        .font(.system(size: 60 ))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text(
                        """
                         It's not how much we give but
                         but how much love we put into giving.
                         """
                    )
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                }
                Spacer()
                
                // MARK: - Center
                RingsView(ringColor: .white.opacity(0.2), forgroundImage: "character-1")

                Spacer()
                
                // MARK: - Footer
                
                ZStack{
                    Capsule()
                        .foregroundColor(.white.opacity(0.2))
                        .frame(height: 80)
                    Capsule()
                        .foregroundColor(.white.opacity(0.2))
                        .frame(height: 60)
                        .padding(.horizontal,10)
                    Text("Get Started")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .offset(x:20)
                    HStack(spacing: 0.0) {
                        Capsule()
                            .frame(width: buttonOffset + 80, height: 80)
                        .foregroundColor(.colorRed)
                        Spacer()
                    }

                    HStack {
                        ZStack{
                            Circle()
                                .fill(.colorRed)
                                .frame(width: 80)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .frame(height: 65)
                            Image(systemName: "chevron.right.2")
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                        .offset(x: buttonOffset)
                        .gesture(DragGesture()
                            .onChanged(){
                                gesture in
                                if (gesture.translation.width > 0) && gesture.translation.width < buttonWidth - 80 {
                                    buttonOffset =  gesture.translation.width
                                }
                            }
                            .onEnded(){
                                _ in
                                if buttonOffset > buttonWidth / 2 {
                                    isOnboardingActive = false
                                } else {
                                    buttonOffset = 0
                                }
                            }
                        )
                        Spacer()
                    }
                    
                   
                }//: ZStack
                .frame(width: buttonWidth,height: 80)
            } // : VStack
        } // : ZStack
    }
}

#Preview {
    OnboardingView()
}
