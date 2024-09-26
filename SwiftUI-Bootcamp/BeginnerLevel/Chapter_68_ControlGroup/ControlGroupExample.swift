//
//  ControlGroupExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 26/09/24.
//

import SwiftUI

struct ControlGroupExample: View {
    @State private var textAlignment: TextAlignment = .leading
    var body: some View {
        ZStack(alignment: .top) {
            Color.green.opacity(0.2).ignoresSafeArea()

            VStack {
                Text("SwiftUI is a declarative framework for building user interfaces for iOS, iPadOS, watchOS, tvOS, visionOS and macOS, developed by Apple Inc. for the Swift programming language")
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    ControlGroup("Alignment") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ControlGroupExample()
}
