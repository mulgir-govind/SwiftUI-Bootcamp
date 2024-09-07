//
//  NavigationViewExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 07/09/24.
//

import SwiftUI

enum ColorCase: String, CaseIterable {
    case RED
    case GREEN
    case YELLOW
    
    var color: Color {
        switch (self) {
            case .RED: .red
            case .GREEN: .green
            case .YELLOW: .yellow
        }
    }
}

struct NavigationViewExample: View {
    let colors: [ColorCase] = [. RED, .GREEN, .YELLOW]

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(colors, id: \.self) { colorCase in
                    NavigationLink("\(colorCase)") {
                        NewColorScreen(selectedColor: colorCase)
                    }
                    .font(.largeTitle)
                    .foregroundStyle(colorCase.color)
                    .padding()
                }
            }
            .navigationTitle("All Colors")
            //            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.title)
                        Image(systemName: "message.badge")
                            .font(.title)
                    },
                trailing:
                    NavigationLink(destination: {
                        SettingsScreen()
                    }, label: {
                        Image(systemName: "gear")
                            .font(.title)
                    })
                    .accentColor(.red)
            )
        }
    }
}

struct NewColorScreen: View {
    let selectedColor: ColorCase
    var body: some View {
        ZStack {
            selectedColor.color
                .ignoresSafeArea()
            
            VStack {
                Text("Selected color is: \(selectedColor)")
            }
        }
    }
}

struct SettingsScreen: View {
    @Environment(\.dismiss) var screenDismiss

    var body: some View {
        ZStack {
            Color.teal.opacity(0.5)
                .ignoresSafeArea()

            // Hide the navigation bar button
                .navigationBarBackButtonHidden()

            VStack(spacing: 30) {
                Text("Settings screen")
                    .font(.title)
                Button(action: {
                    screenDismiss()
                }, label: {
                    Text("Custom close button")
                })
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    NavigationViewExample()
}
