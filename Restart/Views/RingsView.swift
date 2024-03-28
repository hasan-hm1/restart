//
//  RingsView.swift
//  Restart
//
//  Created by Hasan on 3/28/24.
//

import SwiftUI

struct RingsView: View {
    var ringColor: Color
    var forgroundImage: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 40)
                .foregroundColor(ringColor)
                .frame(width: 256, height: 256, alignment: .center)
            Circle()
                .stroke(lineWidth: 80)
                .foregroundColor(ringColor)
                .frame(width: 256, height: 256, alignment: .center)
            Image(forgroundImage)
                .resizable()
                .scaledToFit()
                .padding()
        }
    }
}

#Preview {
    ZStack{
        Color(.colorBlue).ignoresSafeArea()
        RingsView(ringColor: .white.opacity(0.2), forgroundImage: "character-1")
    }

}
