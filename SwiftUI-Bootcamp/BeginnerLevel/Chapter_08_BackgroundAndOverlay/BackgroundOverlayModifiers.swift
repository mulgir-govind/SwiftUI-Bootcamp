//
//  BackgroundOverlayModifiers.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 29/08/24.
//

import SwiftUI

struct BackgroundOverlayModifiers: View {
    var body: some View {
        Text("Text with plain background color")
            .background(Color.blue)
        
        Text("Text with background gradient color")
            .background(
                LinearGradient(
                    colors: [ Color.red, Color.yellow, Color.green ],
                    startPoint: .leading,
                    endPoint: .trailing)
            )
        
        Text("Text with background shape")
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.pink, .yellow, .green],
                            startPoint: .center,
                            endPoint: .bottomTrailing)
                    )

            )
        
        Text("Follow Unread message view is creating by using both overlays & background modifiers")
        Image(systemName: "message.fill")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .frame(width: 100, height: 100)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.yellow, .green, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
            )
            .overlay(
                Circle()
                    .fill(.red)
                    .frame(width:30, height: 30)
                    .overlay(
                        Text("5")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    )
               , alignment: .bottomTrailing
            )
    }
}

#Preview {
    BackgroundOverlayModifiers()
}
