//
//  ShadowExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 29/08/24.
//

import SwiftUI

struct ShadowExample: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .shadow(color: .secondary, radius: 10, x: 10, y: 15)

        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                LinearGradient(
                    colors: [.green, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .frame(width: 300, height: 200)
            .overlay(
                Text("Shadow example")
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
            )
            .shadow(color:.primary, radius: 5, x: 10, y: 10)
            .padding()

        Image("cat")
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .shadow(color: .pink, radius: 10)
    }
}

#Preview {
    ShadowExample()
}
