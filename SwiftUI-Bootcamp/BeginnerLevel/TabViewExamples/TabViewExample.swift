//
//  TabViewExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 14/09/24.
//

import SwiftUI

struct TabViewExample: View {
    @State private var selectedTab: Int = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            NotificationPage()
                .tabItem {
                    Image(systemName: "bell")
                    Label("Notifications", systemImage: "bell")
                }
                .badge(10)
                .tag(1)
            ProfilePage()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(2)
            OnboardingPage()
                .tabItem {
                    Image(systemName: "arrow.circlepath")
                    Text("Onboarding")
                }
                .tag(3)
        }
    }
}

struct HomePage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(0 ..< 5) { item in
                        PostView()
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: SearchPage(), label: {
                        Image(systemName: "magnifyingglass.circle")
                    })
            )
            .tint(.blue)
        }
    }
}

struct NotificationPage: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1 ..< 11) { item in
                    Text("Unread message: \(item)")
                }
            }
            .navigationTitle("Notifications")
        }
    }
}

struct SearchPage: View {
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            TextField("Type to search...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding()
            List {
                ForEach(1..<5) { item in
                    Text("Recent search: \(item)")
                }
            }
        }
        .padding()
    }
}

struct ProfilePage: View {
    @State private var searchText: String = ""
    private let gridItems: [GridItem] = [
        GridItem(.fixed(100), alignment: .trailing),
        GridItem(.flexible(minimum: 200, maximum: .infinity), alignment: .leading)
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 140, height: 140)
            
            LazyVGrid(columns: gridItems, spacing: 20, content: {
                Section {
                    Text("Name:")
                        .bold()
                    Text("Govind Mulgir")
                }
                
                Section {
                    Text("Email:")
                        .bold()
                    Text("govind.mulgir.17@gmail.com")
                }
                
                Section {
                    Text("Mobile:")
                        .bold()
                    Text("+91 **********")
                }
            })
            
            Button(action: {}, label: {
                Label("Edit profile", systemImage: "pencil")
                    .font(.title3)
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        LinearGradient(
                            colors: [.orange, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .clipShape(
                        Capsule(),
                        style: FillStyle())
            })
            
            Spacer()
        }
    }
}

struct OnboardingPage: View {
    var body: some View {
        TabView {
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
                .padding()
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .padding()
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .padding()
                .frame(width: 300, height: 300)
        }
        .frame(height: 300)
        .tabViewStyle(.page)
    }
}

#Preview {
    TabViewExample()
}
