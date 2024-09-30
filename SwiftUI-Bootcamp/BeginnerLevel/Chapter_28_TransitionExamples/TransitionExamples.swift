//
//  TransitionExamples.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 07/09/24.
//

import SwiftUI

struct TransitionExamples: View {
    @State private var showBottomDrawer: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            VStack {
                Button("Start transition") {
                    withAnimation {
                        showBottomDrawer.toggle()
                    }
                }
                .padding(.top, 100)
                .buttonStyle(.borderedProminent)
                
                if showBottomDrawer {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 300, height: 50)
                        .overlay(
                            Text("Slide transition")
                        )
                        .transition(.slide)
                }

                if showBottomDrawer {
                    Rectangle()
                        .fill(.green)
                        .frame(width: 200, height: 50)
                        .overlay(
                            Text("Scale transition")
                        )
                        .transition(.scale(scale: 0.5))
                }
                
                if showBottomDrawer {
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 200, height: 50)
                        .overlay(
                            Text("Opacity change transition")
                        )
                        .transition(.opacity)
                }

                Spacer()
                
                if showBottomDrawer {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.primary)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .overlay(alignment: .top) {
                            VStack() {
                                Capsule()
                                    .fill(.gray)
                                    .frame(width: 80, height: 6)
                                .padding(.vertical, 10)
                                
                                Text("Move toward edge transition")
                                    .foregroundStyle(.white)
                            }
                        }
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TransitionExamples()
}
