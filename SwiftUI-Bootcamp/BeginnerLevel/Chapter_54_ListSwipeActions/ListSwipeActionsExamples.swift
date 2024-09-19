//
//  ListSwipeActionsExamples.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 19/09/24.
//

import SwiftUI

struct ListSwipeActionsExamples: View {
    @State private var colors: [Color] = [
        .blue, .green, .pink, .yellow, .purple,
        .indigo, .red, .orange, .gray, .black
    ]

    var body: some View {
        List {
            ForEach(colors, id: \.self) { color in
                Text("\(color)")
                    .foregroundStyle(color)
                    .font(.title)
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            delete(color: color)
                        }, label: {
                            Text("Delete")
                        })
                        .tint(.red)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            print("Archive color")
                        }, label: {
                            Text("Archive")
                        })
                        .tint(.blue)
                        Button(action: {
                            print("Share color")
                        }, label: {
                            Text("Share")
                        })
                        .tint(.green)
                    }
            }
        }
    }

    func delete(color: Color) {
        colors = colors.filter { $0 != color }
    }
}

#Preview {
    ListSwipeActionsExamples()
}
