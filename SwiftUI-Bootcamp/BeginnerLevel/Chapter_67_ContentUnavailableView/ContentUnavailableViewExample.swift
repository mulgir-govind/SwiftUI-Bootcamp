//
//  ContentUnavailableViewExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/09/24.
//

import SwiftUI

struct ContentUnavailableViewExample: View {
    var body: some View {
        VStack {
            // No search result message
            ContentUnavailableView.search
            
            // No search result message with custom text
            ContentUnavailableView.search(text: "Android")

            // No network message
            ContentUnavailableView(
                "No internet connection",
                systemImage: "wifi.slash",
                description: Text("Please connect to internet and try again")
            )
            
            ContentUnavailableView {
                // 1
                Label("Empty Bookmarks", systemImage: "bookmark")
            } description: {
                Text("Explore a great movie and bookmark the one you love to enjoy later.")
            } actions: {
                // 2
                Button("Browse Movies") {
                    // Go to the movie list.
                    
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ContentUnavailableViewExample()
}
