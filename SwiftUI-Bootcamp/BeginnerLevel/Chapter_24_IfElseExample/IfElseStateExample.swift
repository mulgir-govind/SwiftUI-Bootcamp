//
//  IfElseStateExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 05/09/24.
//

import SwiftUI

struct IfElseStateExample: View {
    @State private var isShowingFirstView: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            // Conditional rendering using if-else
            if isShowingFirstView {
                Text("First View")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            } else {
                Text("Second View")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }

            // Button to toggle views
            Button(action: {
                // Toggle the state property to switch views
                isShowingFirstView.toggle()
            }) {
                Text("Toggle View")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    IfElseStateExample()
}
