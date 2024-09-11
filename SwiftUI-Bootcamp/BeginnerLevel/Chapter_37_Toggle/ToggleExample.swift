//
//  ToggleExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 10/09/24.
//

import SwiftUI

struct ToggleExample: View {
    @State private var darkModeEnabled: Bool = false
    @State private var additionalLoggingEnabled: Bool = true
    @State private var allowHTTPServices: Bool = false
    @State private var disableRateLimit: Bool = false
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()

            NavigationView {
                List {
                    Section {
                        Toggle("Dark appearance ", isOn: $darkModeEnabled)
                            .toggleStyle(.automatic)
                    } header: {
                        Text("Automatic toggle style - Default")
                    }

                    Section {
                        Toggle(isOn: $additionalLoggingEnabled) {
                            Text("Additional logging")
                        }
                        .toggleStyle(.button)
                    } header: {
                        Text("Default toggle style")
                    }
                    
                    Section {
                        Toggle("Allow HTTP services", isOn: $allowHTTPServices)
                            .toggleStyle(.switch)
                    } header: {
                        Text("Switch toggle style")
                    }

                    Section {
                        Toggle("Disable rate limit", isOn: $disableRateLimit)
                            .toggleStyle(CustomToggleStyle())
                    } header: {
                        Text("Custom toggle style")
                    }
                }
                .navigationTitle("Toggle buttons")
            }
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label

            Spacer()

            Button(action: {
                configuration.isOn.toggle()
            }, label: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 34, height: 34)
                    .foregroundStyle(configuration.isOn ? .green : .red)
                    .animation(.easeOut, value: configuration.isOn)
            })
        }
    }
}

#Preview {
    ToggleExample()
}
