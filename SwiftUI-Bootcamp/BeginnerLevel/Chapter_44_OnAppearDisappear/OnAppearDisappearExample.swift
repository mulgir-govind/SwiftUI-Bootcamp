//
//  OnAppearDisappearExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

struct OnAppearDisappearExample: View {
    @State private var logMessages: [String] = []
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    GreenScreen()
                } label: {
                    Text("Open Green screen")
                }
                .onAppear(perform: {
                    logMessages.append("Navigation link view appeared")
                })
                .onDisappear(perform: {
                    logMessages.append("Navigation link view disappeared")
                })

                List {
                    ForEach(0 ..< logMessages.count, id: \.self) { index in
                        Text("\(index + 1): \(logMessages[index])")
                    }
                }
            }
        }
        .onAppear(perform: {
            logMessages.append("Nav view appeared")
        })
    }
}

struct GreenScreen: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
        }
    }
}

#Preview {
    OnAppearDisappearExample()
}
