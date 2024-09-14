//
//  StepperExamples.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 13/09/24.
//

import SwiftUI

struct StepperExamples: View {
    @State private var stepperValue = 0
    @State private var colorOpacity: Double = 0.2
    @State private var circleRadius: Double = 100
    @State private var selectedColor: Color = .green
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    VStack {
                        Text("Default step value = 1")
                        Stepper("Product quantity: \(stepperValue)", value: $stepperValue)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)

                    VStack {
                        Text("custom step value & range")
                        Stepper(
                            "Adjust opacity: \(colorOpacity)",
                            value: $colorOpacity,
                            in: 0.1 ... 1.0,
                            step: 0.1)
                    }
                    .padding()
                    .background(.pink.opacity(colorOpacity))
                    .shadow(radius: 10)
                    
                    VStack {
                        Text("Custom increment/decrement")
                        Stepper("Circle radius:\(circleRadius)") {
                            updateRadius(by: 10)
                        } onDecrement: {
                            updateRadius(by: -10)
                        }
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .green],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                            .frame(width: circleRadius, height: circleRadius)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)

                    VStack {
                        Text("On Editing changed callback")
                        Stepper("Tap & hold stepper button", value: $stepperValue) { valueUpdated in
                            selectedColor = valueUpdated ? .yellow : .green
                        }
                    }
                    .padding()
                    .background(selectedColor)
                    .shadow(radius: 10)
                }
            }
            .navigationTitle("Stepper examples")
        }
    }

    private func updateRadius(by amount: Double) {
        let resultantRadius = circleRadius + amount
        guard resultantRadius >= 50 && resultantRadius <= 200 else { return }
        withAnimation(Animation.spring(Spring())) {
            circleRadius += amount
        }
    }
}

#Preview {
    StepperExamples()
}
