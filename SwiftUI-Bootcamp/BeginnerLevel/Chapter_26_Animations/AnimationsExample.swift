//
//  AnimationsExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 05/09/24.
//

import SwiftUI

struct AnimationsExample: View {
    @State private var currentBGColor: Color = .green
    @State private var isAnimatedVar1: Bool = false
    @State private var isAnimatedVar2: Bool = false
    @State private var isAnimatedVar3: Bool = false
    @State private var isAnimatedVar4: Bool = false
    @State private var isAnimatedVar5: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            currentBGColor.opacity(0.4)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("Animation examples:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)

                    Divider()

                    VStack(spacing: 30) {
                        Button("Without Animation") {
                            isAnimatedVar1.toggle()
                            currentBGColor = isAnimatedVar1 ? .blue.opacity(0.4) : .green.opacity(0.4)
                        }
                        .buttonStyle(.borderedProminent)

                        HStack {
                            RoundedRectangle(cornerRadius: isAnimatedVar1 ? 50 : 25)
                                .fill( isAnimatedVar1 ?  .brown : .green)
                                .frame(
                                    width: isAnimatedVar1 ? 60 : 200,
                                    height: isAnimatedVar1 ? 60 : 200
                                )
                            .offset(x:  isAnimatedVar1 ? 120 : 0)
                            .rotationEffect(
                                Angle(degrees: isAnimatedVar1 ? 360 : 0)
                            )
                        }
                        .frame(height: 200)
                    }
                    
                    Divider()

                    VStack(spacing: 30) {
                        Button("Using withAnimation block") {
                            withAnimation {
                                isAnimatedVar2.toggle()
                                currentBGColor = isAnimatedVar1 ? .yellow.opacity(0.4) : .green.opacity(0.4)
                            }
                        }
                        .buttonStyle(.borderedProminent)

                        HStack {
                            RoundedRectangle(cornerRadius: isAnimatedVar2 ? 50 : 25)
                                .fill( isAnimatedVar2 ?  .purple : .red)
                                .frame(
                                    width: isAnimatedVar2 ? 60 : 200,
                                    height: isAnimatedVar2 ? 60 : 200
                                )
                                .rotationEffect(
                                    Angle(degrees: isAnimatedVar2 ? 360 : 0)
                                )
                                .offset(x:  isAnimatedVar2 ? 120 : 0, y: 0)
                        }
                        .frame(height: 200)
                    }

                    Divider()

                    VStack(spacing: 30) {
                        Button("Using withAnimation block & delay") {
                            withAnimation(.default.delay(1.0)) {
                                isAnimatedVar3.toggle()
                            }
                        }
                        .buttonStyle(.borderedProminent)

                        HStack {
                            RoundedRectangle(cornerRadius: isAnimatedVar3 ? 50 : 25)
                                .fill( isAnimatedVar3 ?  .pink.opacity(0.8) : .yellow.opacity(0.8))
                                .frame(
                                    width: isAnimatedVar3 ? 60 : 200,
                                    height: isAnimatedVar3 ? 60 : 200
                                )
                                .rotationEffect(
                                    Angle(degrees: isAnimatedVar3 ? -360 : 0)
                                )
                                .offset(x:  isAnimatedVar3 ? -120 : 0, y: 0)
                        }
                        .frame(height: 200)
                    }

                    Divider()

                    VStack(spacing: 30) {
                        Button("Using withAnimation block & repeat count") {
                            withAnimation(.default.repeatCount(5, autoreverses: true)) {
                                isAnimatedVar4.toggle()
                                currentBGColor = isAnimatedVar4 ? .black.opacity(0.8) : .white.opacity(0.8)
                            }
                        }
                        .buttonStyle(.borderedProminent)

                        HStack {
                            RoundedRectangle(cornerRadius: isAnimatedVar4 ? 50 : 25)
                                .fill( isAnimatedVar4 ?  .white.opacity(0.8) : .black.opacity(0.8))
                                .frame(
                                    width: isAnimatedVar4 ? 60 : 200,
                                    height: isAnimatedVar4 ? 60 : 200
                                )
                                .rotationEffect(
                                    Angle(degrees: isAnimatedVar4 ? -360 : 0)
                                )
                        }
                        .frame(height: 200)
                    }

                    Divider()
                    
                    VStack(spacing: 30) {
                        Button("Using withAnimation block & repeat foreever") {
                            withAnimation(.default.repeatForever(autoreverses: true)) {
                                isAnimatedVar5.toggle()
                                currentBGColor = isAnimatedVar5 ? .indigo.opacity(0.8) : .teal.opacity(0.8)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: isAnimatedVar5 ? 50 : 25)
                                .fill( isAnimatedVar5 ?  .teal.opacity(0.8) : .indigo.opacity(0.8))
                                .frame(
                                    width: isAnimatedVar5 ? 60 : 200,
                                    height: isAnimatedVar5 ? 60 : 200
                                )
                        }
                        .frame(height: 200)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    AnimationsExample()
}
