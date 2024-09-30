//
//  StatePropertyWrapperExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 04/09/24.
//

import SwiftUI

struct StatePropertyWrapperExample: View {
    @State var selectedColor: Color = .blue

    var body: some View {
        ZStack {
            selectedColor
                .opacity(0.2)
                .ignoresSafeArea()

            VStack {
                VStack {
                    Text("Selected color hash:")
                        .font(.title)
                    Text("\(hexString(from: selectedColor))")
                }
                .foregroundStyle(selectedColor)

                Spacer()

                ColorPicker("Color picker", selection: $selectedColor, supportsOpacity: false)
                    .font(.body.bold())
                    .frame(maxWidth: 300, maxHeight: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(.white)
                    )
                    .shadow(radius: 10)
                Spacer()
            }
        }
    }

    // Helper function to extract hex string from Color
    private func hexString(from color: Color) -> String {
        let components = UIColor(color).cgColor.components
        let r = components?[0] ?? 0
        let g = components?[1] ?? 0
        let b = components?[2] ?? 0

        return String(format: "#%02lX%02lX%02lX",
                      lround(Double(r * 255)),
                      lround(Double(g * 255)),
                      lround(Double(b * 255)))
    }
}

#Preview {
    StatePropertyWrapperExample()
}
