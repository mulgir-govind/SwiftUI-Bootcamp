//
//  PickerExamples.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 12/09/24.
//

import SwiftUI

struct PickerExamples: View {
    @State private var selectedDay: Int = 1
    @State private var days: [ Int ] = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
        14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
        27, 28, 29, 30, 31
    ]
    @State private var months: [ Int ] = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @State private var years: [ Int ] = [ 2024, 2023, 2022, 2021, 2020 ]

    @State private var dobDay: Int = 1
    @State private var dobMonth: Int = 1
    @State private var dobYear: Int = 2024
    
    @State private var genderList = ["Male", "Female", "Other"]
    @State private var selectedGender: String = "Male"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Default picker style:")
                            Text("Menu")
                                .underline()
                        }
                        .font(.title2)
                        HStack {
                            Text("Selected value: \(selectedDay)")
                            Spacer()
                            Picker("Select day", selection: $selectedDay) {
                                ForEach(1 ..< days.count, id: \.self) { day in
                                    Text("\(day)")
                                        .tag(day)
                                }
                            }
                            .background(
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.pink, .yellow],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing)
                                    )
                                    .frame(width: 60, height: 40)
                            )
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    .background(.tertiary)
                    .shadow(radius: 10)

                    VStack(spacing: 20) {
                        HStack {
                            Text("Default picker style:")
                            Text("Wheel")
                                .underline()
                        }
                        .font(.title2)
                        VStack {
                            Text("DOB: \(dobDay)/\(dobMonth)/\(String(dobYear))")
                            Spacer()
                            HStack {
                                Picker("Select day", selection: $dobDay) {
                                    ForEach(days, id: \.self) { day in
                                        Text("\(day)")
                                            .tag(day)
                                    }
                                }
                                .pickerStyle(.wheel)

                                Picker("Select month", selection: $dobMonth) {
                                    ForEach(months, id: \.self) { month in
                                        Text("\(month)")
                                            .tag(month)
                                    }
                                }
                                .pickerStyle(.wheel)
                                
                                Picker("Select year", selection: $dobYear) {
                                    ForEach(years, id: \.self) { year in
                                        Text(String(year))
                                            .tag(year)
                                    }
                                }
                                .pickerStyle(.wheel)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    .background(.tertiary)
                    .shadow(radius: 10)
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Default picker style:")
                            Text("Segmented")
                                .underline()
                        }
                        .font(.title2)
                        VStack {
                            Text("Gender: \(selectedGender)")
                            Spacer()
                            HStack {
                                Picker("Select gender", selection: $selectedGender) {
                                    ForEach(genderList, id: \.self) { gender in
                                        Text("\(gender)")
                                            .tag(gender)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    .background(.tertiary)
                    .shadow(radius: 10)
                }
                .padding()
            }
            .navigationTitle("Picker examples")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PickerExamples()
}
