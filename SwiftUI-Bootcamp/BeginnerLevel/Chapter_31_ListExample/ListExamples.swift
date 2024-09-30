//
//  ListExamples.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 08/09/24.
//

import SwiftUI

struct ListExamples: View {
   @State var states = [
        "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana",
        "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya",
        "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
        "Uttar Pradesh", "Uttarakhand", "West Bengal"
    ]

    @State var unionTerritories = [
        "Andaman and Nicobar Islands",
        "Chandigarh",
        "Dadra and Nagar Haveli and Daman and Diu",
        "Lakshadweep",
        "Delhi",
        "Puducherry",
        "Ladakh",
        "Jammu and Kashmir"
    ]

    var body: some View {
        NavigationView {
            List {
                // Union territories
                Section {
                    ForEach(unionTerritories, id: \.self) { unionTerritory in
                        NavigationLink(unionTerritory) {
                            StateDetailsView(state: unionTerritory)
                        }
                    }
//                    .onDelete(perform: { indexSet in
//                        unionTerritories.remove(atOffsets: indexSet)
//                    })
//                    .onDelete(perform: deleteTerritory(at:))
                    .onDelete(perform: deleteTerritory) // CLEANER WAY
//                    .onMove(perform: { indices, newOffset in
//                        reorderTerritory(from: indices, to: newOffset)
//                    })
//                    .onMove(perform: reorderTerritory(from:to:))
                    .onMove(perform: reorderTerritory) // CLEANER WAY
                } header: {
                    HStack {
                        Image(systemName: "location.circle.fill")
                        Text("Union territories")
                    }
                    .font(.headline)
                    .foregroundStyle(.orange)
                }
                .listRowBackground(
                    Color.mint.opacity(0.5)
                )

                // States
                Section {
                    ForEach(states, id: \.self) { state in
                        Text(state)
                    }
                    .onDelete(perform: { indexSet in
                        states.remove(atOffsets: indexSet)
                    })
                } header: {
                    Text("States")
                        .font(.headline)
                        .foregroundStyle(.pink)
                }
                .listRowBackground(Color.green.opacity(0.3))
            }
//            .listStyle(.grouped)
            .listStyle(.grouped)
            .navigationTitle("Indian states")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
            .background(.teal)
        }
    }

    var addButton: some View {
        Button("Add", action: {
            unionTerritories.append("New union territory \(unionTerritories.count + 1)")
        })
    }
    
    func deleteTerritory(at indexSet: IndexSet) {
        unionTerritories.remove(atOffsets: indexSet)
    }
    
    func reorderTerritory(from offsets: IndexSet, to newOffset: Int) {
        unionTerritories.move(fromOffsets: offsets, toOffset: newOffset)
    }
}

struct StateDetailsView: View {
    let state: String
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                Text(state)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ListExamples()
}
