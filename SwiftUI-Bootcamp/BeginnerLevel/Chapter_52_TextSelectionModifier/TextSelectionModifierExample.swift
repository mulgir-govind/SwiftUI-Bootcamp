//
//  TextSelectionModifierExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 18/09/24.
//

import SwiftUI

struct TextSelectionModifierExample: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("This is non-selectable text.")
                .font(.title)

            Text("This is selectable text. Long press to see selection options.")
                .font(.title3)
                .textSelection(.enabled)
        }
        .padding()
    }
}

#Preview {
    TextSelectionModifierExample()
}
