//
//  ForEachLoopExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 30/08/24.
//

import SwiftUI

struct ForEachLoopExample: View {

    let colorGridData: [[(name: String, color: Color)]] = [
        [("Red", .red), ("Orange", .orange), ("Yellow", .yellow)],
        [("Green", .green), ("Blue", .blue), ("Indigo", .indigo)],
        [("Violet", .purple), ("Pink", .pink), ("Brown", .brown)]
    ]

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<colorGridData.count, id: \.self) { rowIndex in
                HStack(spacing: 20) {
                    ForEach(0..<colorGridData[rowIndex].count, id: \.self) { columnIndex in
                        let item = colorGridData[rowIndex][columnIndex]
                        VStack {
                            Text(item.name)
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 80, height: 80)
                                .background(item.color)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()

        ForEach(0 ..< 10) { item in
            Text("\(item)")
                .foregroundColor(.white)
                .frame(maxWidth: 50, maxHeight: 50)
                .background(.blue)
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
        }
    }
}

#Preview {
    ForEachLoopExample()
}
