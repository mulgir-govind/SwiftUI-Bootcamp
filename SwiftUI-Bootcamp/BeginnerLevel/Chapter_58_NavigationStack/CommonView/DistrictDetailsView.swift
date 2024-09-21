//
//  DistrictDetailsView.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import SwiftUI

struct DistrictDetailsView: View {
    let selectedDistrict: District
    var body: some View {
        VStack {
            VStack(alignment:.leading, spacing: 30) {
                Text(selectedDistrict.name)
                    .font(.title)

                Text(selectedDistrict.description)
                    .font(.body)
                    .fontWeight(.light)

                List {
                    Section {
                        ForEach(selectedDistrict.cities) { city in
                            NavigationLink(value: city) {
                                Text(city.name)
                            }
                        }
                    } header: {
                        Text("Popular city")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    DistrictDetailsView(selectedDistrict: IndianState.sampleData().randomElement()!.popularDistricts.randomElement()!)
}
