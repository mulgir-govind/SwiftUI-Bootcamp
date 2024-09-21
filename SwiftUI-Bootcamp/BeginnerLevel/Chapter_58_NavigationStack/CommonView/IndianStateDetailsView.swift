//
//  IndianStateDetailsView.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import SwiftUI

struct IndianStateDetailsView: View {
    let selectedState: IndianState
    var body: some View {
        VStack(alignment:.leading, spacing: 30) {
            Text(selectedState.name)
                .font(.title)

            Text(selectedState.description)
                .font(.body)
                .fontWeight(.light)

            List {
                Section {
                    ForEach(selectedState.popularDistricts) { district in
                        NavigationLink(value: district) {
                            Text(district.name)
                        }
                    }
                } header: {
                    Text("Popular districts")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    IndianStateDetailsView(selectedState: IndianState.sampleData().first!)
}
