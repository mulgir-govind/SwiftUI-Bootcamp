//
//  IndianStateListView.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import SwiftUI

struct IndianStateListView: View {
    let indianStates: [IndianState]
    var body: some View {
        List(indianStates) { indianState in
            NavigationLink(value: indianState) {
                Text(indianState.name)
            }
        }
    }
}

#Preview {
    IndianStateListView(indianStates: IndianState.sampleData())
}
