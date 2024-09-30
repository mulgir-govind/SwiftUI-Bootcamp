//
//  CityDetailsView_2.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import SwiftUI
import Charts

struct CityDetailsView_2: View {
    @EnvironmentObject var router: CustomNavigationRouter
    let selectedCity: City
    var body: some View {
        VStack(alignment:.leading, spacing: 30) {
            Text(selectedCity.name)
                .font(.title)

            Text(selectedCity.description)
                .font(.body)
                .fontWeight(.light)

            // Chart view
            VStack {
                let genderData = selectedCity.genderData
                Chart {
                    BarMark(x: .value("Gender", "Male"),
                            y: .value("Population", genderData.male))
                    .foregroundStyle(.blue)
                    
                    BarMark(x: .value("Gender", "Female"),
                            y: .value("Population", genderData.female))
                    .foregroundStyle(.green)
                    
                    BarMark(x: .value("Gender", "Other"),
                            y: .value("Population", genderData.other))
                    .foregroundStyle(.yellow)
                }
                .chartXAxisLabel("Gender")
                .chartYAxisLabel("Population")
                .frame(height: 300)
            }

            VStack(alignment: .center) {
                Button(action: {
                    router.resetPath()
                }, label: {
                    Text("Go to main screen")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .frame(maxWidth: .infinity)

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    CityDetailsView_2(selectedCity: IndianState.sampleData().randomElement()!.popularDistricts.randomElement()!.cities.randomElement()!)
        .environmentObject(CustomNavigationRouter())
}
