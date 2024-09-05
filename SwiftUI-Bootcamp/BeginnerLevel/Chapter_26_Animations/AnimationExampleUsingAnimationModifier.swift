//
//  AnimationExampleUsingAnimationModifier.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 05/09/24.
//

import SwiftUI

struct AnimationExampleUsingAnimationModifier: View {
    @State private var currentBGColor: Color = .green
    @State private var isAnimatedVar1: Bool = false
    var body: some View {
        ZStack {
            currentBGColor.opacity(0.4)
            // Adding animation as modifier apply to specific view
                .animation(.default.delay(2.0), value: currentBGColor)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("Animation examples:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                    
                    Divider()

                    VStack(spacing: 30) {
                        Button("Using withAnimation block") {
                            isAnimatedVar1.toggle()
                            // Updating bg color, immediately update bg color
                            // and rectangle is animated with delay.
                            currentBGColor = isAnimatedVar1 ? .blue.opacity(0.4) : .green.opacity(0.4)
                        }
                        .buttonStyle(.borderedProminent)                        
                        HStack {
                            RoundedRectangle(cornerRadius: isAnimatedVar1 ? 50 : 25)
                                .fill( isAnimatedVar1 ?  .purple : .red)
                                .frame(
                                    width: isAnimatedVar1 ? 60 : 200,
                                    height: isAnimatedVar1 ? 60 : 200
                                )
                                .rotationEffect(
                                    Angle(degrees: isAnimatedVar1 ? 360 : 0)
                                )
                                .offset(x:  isAnimatedVar1 ? 120 : 0, y: 0)
                                .animation(.default.delay(2.0), value: isAnimatedVar1)
                        }
                        .frame(height: 200)
                    }
                }
            }
        }
    }
}

#Preview {
    AnimationExampleUsingAnimationModifier()
}
