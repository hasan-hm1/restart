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
    @State private var isAnimating: Bool = false
    @State private var imageOffset : CGSize = .zero
    @State private var indicatorOpacity : Double = 1.0
    @State private var titleText : String = "Share."
    var body: some View {
        ZStack{
            Color(.colorBlue)
                .ignoresSafeArea()
            
            VStack(spacing:20){
                // MARK: - Header
                VStack(){
                    Text(titleText)
                        .font(.system(size: 60 ))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(titleText)
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1),value: isAnimating)
                Spacer()
                
                // MARK: - Center
                ZStack {
                    RingsView(ringColor: .white.opacity(0.2))
                        .offset(x: imageOffset.width * -1, y: imageOffset.height)
                        .blur(radius: abs(imageOffset.width / 20))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .opacity(isAnimating ? 1 :  0)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: imageOffset.height)
                        .rotationEffect(.degrees(Double(imageOffset.width/20)))
                        .gesture(DragGesture(
                            
                        ).onChanged(){
                            gesture in
                            if abs(gesture.translation.width) <= 150 {
                                imageOffset.width = gesture.translation.width
                            }
                            withAnimation(.linear(duration: 0.25)){
                                indicatorOpacity = 0.0
                                titleText = "Give."
                            }
                        }.onEnded(){
                            _ in
                            imageOffset = .zero
                            withAnimation(.linear(duration: 0.25)){
                                indicatorOpacity = 1.0
                                titleText = "Share."
                            }
                        }
                        )// : Gesture
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                .overlay(
                    alignment: .bottom,
                    content: {
                        // notice the two opacaity modifiers
                    Image(systemName: "arrow.left.and.right.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 44))
                        .fontWeight(.ultraLight)
                        .offset(y:10)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                })

                
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
                                withAnimation(.easeInOut(duration: 0.4)){
                                    if buttonOffset > buttonWidth / 2 {
                                        isOnboardingActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                            }
                        )
                        Spacer()
                    }
                    
                   
                }//: ZStack
                .frame(width: buttonWidth,height: 80)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } // : VStack
        } // : ZStack
        .onAppear(){
            isAnimating = true
        }
    }
}

#Preview {
    OnboardingView()
}
