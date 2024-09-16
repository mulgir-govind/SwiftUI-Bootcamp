//
//  DarkModeExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

struct DarkModeExample: View {
    @State private var darkModeEnabled: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            List {
                Toggle("Dark appearance", isOn: $darkModeEnabled)
                    .tint(.red)
                Text("Primary text color")
                    .foregroundStyle(.primary)
                Text("Secondary text color")
                    .foregroundStyle(.secondary)
                Text("Tertiary text color")
                    .foregroundStyle(.tertiary)
                Text("Custom text color")
                    .foregroundStyle(Color("CustomTextColor"))
            }
            .background(Color("CustomColor"))
            .scrollContentBackground(.hidden)
        }
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}

#Preview {
    DarkModeExample()
}
