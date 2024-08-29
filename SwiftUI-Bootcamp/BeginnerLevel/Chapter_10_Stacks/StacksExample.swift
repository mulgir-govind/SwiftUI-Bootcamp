//
//  StacksExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 29/08/24.
//

import SwiftUI

struct StacksExample: View {
    var body: some View {
        // VStack - element vertically aligned
        // VStack - element horizontally aligned
        // ZStack - element z indexed (back to front)
        Text("VStack: with default spacing & center alignment")
        VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)

            Rectangle()
                .fill(.green)
                .frame(width: 30, height: 30)

            Rectangle()
                .fill(.blue)
                .frame(width: 20, height: 20)
        }
        .border(.primary, width: 1.0)

        Text("HStack: with no spacing & bottom alignment")
        HStack(alignment: .bottom, spacing: 0) {
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)

            Rectangle()
                .fill(.green)
                .frame(width: 30, height: 30)

            Rectangle()
                .fill(.blue)
                .frame(width: 20, height: 20)
        }
        .border(.primary, width: 1.0)

        Text("ZStack: with default center alignment")
        ZStack(alignment: .center) {
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)

            Rectangle()
                .fill(.green)
                .frame(width: 30, height: 30)

            Rectangle()
                .fill(.blue)
                .frame(width: 20, height: 20)
        }
        .border(.primary, width: 1.0)

        ZStack {
            Rectangle()
                .fill(.secondary)
                .frame(width: 200, height: 50)
            Text("Using ZStack")
                .foregroundStyle(.primary)
        }

        Text("Using background")
            .foregroundStyle(.primary)
            .background(
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 200, height: 50)
            )
            .padding()

        Rectangle()
            .fill(.secondary)
            .frame(width: 200, height: 50)
            .overlay {
                Text("Using overlay")
                    .foregroundStyle(.primary)
            }
    }
}

#Preview {
    StacksExample()
}
