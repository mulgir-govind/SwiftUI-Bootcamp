//
//  NavigationStackExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 20/09/24.
//

import SwiftUI

struct NavigationStackExample: View {    
    @StateObject var router = CustomNavigationRouter()

    var body: some View {
        TabView {
            NavigationStack {
                ZStack {
                    IndianStateListView(indianStates: IndianState.sampleData())
                }
                .navigationTitle("Indian states")
                .navigationDestination(for: IndianState.self) { state in
                    IndianStateDetailsView(selectedState: state)
                }
                .navigationDestination(for: District.self) { district in
                    DistrictDetailsView(selectedDistrict: district)
                }
                .navigationDestination(for: City.self) { city in
                    CityDetailsView(selectedCity: city)
                }
            }
            .tabItem {
                Text("Approach 1")
                Image(systemName:"1.circle")
            }
            .tag("tab1")
            .tint(.green)

            NavigationStack(path: $router.path) {
                ZStack {
                    IndianStateListView(indianStates: IndianState.sampleData())
                }
                .navigationTitle("Indian states")
                .navigationDestination(for: IndianState.self) { state in
                    IndianStateDetailsView(selectedState: state)
                }
                .navigationDestination(for: District.self) { district in
                    DistrictDetailsView(selectedDistrict: district)
                }
                .navigationDestination(for: City.self) { city in
                    // 2nd City details view
                    CityDetailsView_2(selectedCity: city)
                        .environmentObject(router)
                }
            }
            .tabItem {
                Text("Approach 2")
                Image(systemName:"2.circle")
            }
            .tag("tab2")
            .tint(.red)
        }
    }
}

#Preview {
    NavigationStackExample()
}
