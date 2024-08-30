//
//  ContentView.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 24/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                InitAndEnumExample(orderStatus: .pending, orderCount: 5)
                InitAndEnumExample(orderStatus: .completed, orderCount: 2)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
