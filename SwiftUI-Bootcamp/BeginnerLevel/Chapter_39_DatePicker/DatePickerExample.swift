//
//  DatePickerExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 12/09/24.
//

import SwiftUI

struct DatePickerExample: View {
    @State private var selectedDate: Date = Date()
    private let startDate: Date = Calendar.current.date(from: DateComponents(year: 2022)) ?? Date()
    private let endDate: Date = Date()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    VStack {
                        Text("Default")
                            .font(.title2)
                        DatePicker("selecte date:", selection: $selectedDate)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)
                    
                    VStack {
                        Text("Compact style")
                            .font(.title2)
                        DatePicker("selecte date:", selection: $selectedDate)
                            .tint(.red)
                            .datePickerStyle(.compact)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)

                    VStack {
                        Text("Graphical style")
                            .font(.title2)
                        DatePicker("selecte date:", selection: $selectedDate)
                            .datePickerStyle(.graphical)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)
                    
                    VStack {
                        Text("Wheel style")
                            .font(.title2)
                        DatePicker("selecte date:", selection: $selectedDate)
                            .datePickerStyle(.wheel)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)
                    
                    VStack {
                        Text("Display component - date only")
                            .font(.title2)
                        DatePicker("Select date", selection: $selectedDate, displayedComponents: [.date])
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)
                    
                    VStack {
                        Text("Display component - time only")
                            .font(.title2)
                        DatePicker("Select date", selection: $selectedDate, displayedComponents: [.hourAndMinute])
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)

                    VStack {
                        Text("Date range")
                            .font(.title2)
                        DatePicker("Select date:", selection: $selectedDate, in: startDate ... endDate)
                    }
                    .padding()
                    .background(.white)
                    .shadow(radius: 10)
                }
            }
            .padding()
            .navigationTitle("Date pickers")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DatePickerExample()
}
