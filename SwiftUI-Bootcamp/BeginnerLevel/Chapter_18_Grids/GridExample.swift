//
//  GridExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 31/08/24.
//

import SwiftUI

struct GridExample: View {
    var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 2, verticalSpacing: 2) {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in Color.red }
            }

            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in Color.green }
            }

            GridRow {
                Text("Row 3")

                // Default - center aligned
                Color.yellow
                    .frame(width: 30, height: 50)
                
                ForEach(0..<2) { _ in
                    Color.blue
                        .frame(width: 30, height: 150)
                        .gridColumnAlignment(.trailing)
                }
                
                Color.yellow
                    .frame(width: 30, height: 50)
                    .gridColumnAlignment(.leading) // left/leading aligned
            }

            GridRow {
                Text("Row 4")
                ForEach(0..<2) { _ in
                    Color.purple
                        .gridCellColumns(2)
                        .overlay(Text("MergedCell").foregroundStyle(.white))
                }
            }
        }
        .padding()
        .frame(height: 400)
    }
}

#Preview {
    GridExample()
}
