//
//  IgnoreSafeAreaExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 02/09/24.
//

import SwiftUI

struct IgnoreSafeAreaExample: View {
    
    let colors: [Color] = [.blue, .green, .pink, .yellow, .purple, .indigo, .red, .orange, .gray, .white]
    
    var body: some View {
        // Default behaviour
        // - All views are laid out within the safe area.
        // - Add `.ignoresSafeArea()` on parent view - Check `ContentView` file
        ScrollView {
            VStack {
                Text("Some title")
                    .font(.largeTitle)
                ForEach(1 ..< colors.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10 )
                        .fill(colors[index])
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .padding()
                        .shadow(radius: 10)
                        .overlay(
                            Text("Box no: \(index)")
                        )
                }
            }
        }
     //   .ignoresSafeArea()
    }
}

#Preview {
    IgnoreSafeAreaExample()
}
