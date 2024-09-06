//
//  AnimationCurvesExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 06/09/24.
//

import SwiftUI

struct AnimationCurvesExample: View {
    @State private var isAnimated: Bool = false
    var body: some View {
        VStack(spacing: 30) {
            Button("Animation") {
                isAnimated.toggle()
            }

            Rectangle()
                .fill(.yellow)
                .frame(
                    width: isAnimated ? 300 : 100,
                    height: 60
                )
                .animation(Animation.default, value: isAnimated)

            Rectangle()
                .fill(.red)
                .frame(
                    width: isAnimated ? 300 : 100,
                    height: 60
                )
            .animation(Animation.easeIn, value: isAnimated)

            Rectangle()
                .fill(.green)
                .frame(
                    width: isAnimated ? 300 : 100,
                    height: 60
                )
                .animation(Animation.easeOut, value: isAnimated)

            Rectangle()
                .fill(.blue)
                .frame(
                    width: isAnimated ? 300 : 100,
                    height: 60
                )
                .animation(Animation.easeInOut, value: isAnimated)
            
            Rectangle()
                .fill(.purple)
                .frame(
                    width: isAnimated ? 300 : 100,
                    height: 60
                )
                .overlay(
                    Text("Spring")
                )
                .animation(
                    .spring(response: 3.0, dampingFraction: 0.5, blendDuration: 1.0),
                    value: isAnimated)
        }
        .frame(height: 200)
    }
}

#Preview {
    AnimationCurvesExample()
}
