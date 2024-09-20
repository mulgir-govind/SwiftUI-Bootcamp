//
//  BadgeExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 20/09/24.
//

import SwiftUI

struct BadgeExample: View {
    @State private var unreadMessages: Int = 2
    @State private var newDeviceBadgeTitle: String? = "New"

    var body: some View {
        TabView {
            // Tab 1
            Text("Home screen")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            // Tab 2
            IPhoneListTabContent(newDeviceBadgeTitle: $newDeviceBadgeTitle)
                .tabItem {
                    Label("iPhone", systemImage: "iphone")
                }
                .badge(newDeviceBadgeTitle)

            // Tab 3
            MessageTabContent(unreadMessages: $unreadMessages)
            .onAppear(perform: {
                unreadMessages = 0
            })
            .tabItem {
                Text("Notifications")
                Image(systemName: "message")
            }
            .badge(unreadMessages)
        }
    }
}

struct HomeScreenContent: View {
    var body: some View {
        Text("Home screen")
    }
}

struct IPhoneListTabContent: View {
    @Binding var newDeviceBadgeTitle: String?
    var body: some View {
        List {
            Text("iPhone 16")
                .badge("Newly launched - badge")
            Text("iPhone 15")
            Text("iPhone 14")
            Text("iPhone 14")
            Text("iPhone X")
                .badge("Only few in stock - badge")
        }
        .onAppear(perform: {
            newDeviceBadgeTitle = nil
        })
    }
}

struct MessageTabContent: View {
    @Binding var unreadMessages: Int
    var body: some View {
        List {
            Text("Unread messages")
                .badge(2)
        }
        .onAppear(perform: {
            unreadMessages = 0
        })
    }
}

#Preview {
    BadgeExample()
}
