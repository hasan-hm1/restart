//
//  RingsView.swift
//  Restart
//
//  Created by Hasan on 3/28/24.
//

import SwiftUI

struct RingsView: View {
    var ringColor: Color
    @State private var isAnimating : Bool = false
    var body: some View {
        ZStack {
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 40)
                    .foregroundColor(ringColor)
                .frame(width: 256, height: 256, alignment: .center)
                Circle()
                    .stroke(lineWidth: 80)
                    .foregroundColor(ringColor)
                    .frame(width: 256, height: 256, alignment: .center)
            }

                .blur(radius: isAnimating ? 0 : 10)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0)
        }
        .onAppear(){
            withAnimation(.easeOut(duration: 1)){
                isAnimating = true
            }
            
        }
    }
}

#Preview {
    ZStack{
        Color(.colorBlue).ignoresSafeArea()
        RingsView(ringColor: .white.opacity(0.2)  )
    }

}
