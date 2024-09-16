//
//  CustomModelExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id: UUID = UUID()
    let userName: String
    let displayName: String
    let avatar: String
    var isFollowing: Bool = false
}

struct CustomModelExample: View {
    @State var suggestions: [Suggestion] = [
        Suggestion(userName: "virat.kohli", displayName: "Virat Kohli", avatar: "18.circle.fill"),
        Suggestion(userName: "mahi7781", displayName: "M S Dhoni", avatar: "07.circle.fill"),
        Suggestion(userName: "jayshetty", displayName: "Jay Sheety", avatar: "mic.circle"),
        Suggestion(userName: "_camgreen_", displayName: "Cameron Green", avatar: "cricket.ball.circle"),
        Suggestion(userName: "pvsindhu1", displayName: "PV Sindhu", avatar: "figure.badminton"),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(suggestions) { suggestion in
                    SuggestionRow(suggestion: suggestion)
                }
                .onDelete(perform: { indexSet in
                    suggestions.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Suggestions")
        }
    }
}

struct SuggestionRow: View {
    var suggestion: Suggestion
    @State private var isFollowed: Bool = false
    
    private let gridColumns: [GridItem] = [
        GridItem(.fixed(40), spacing: 20, alignment: .leading),
        GridItem(.flexible(minimum: 120, maximum: 150), alignment: .leading),
        GridItem(.flexible(minimum: 40, maximum: 100), alignment: .trailing)
    ]

    var body: some View {
        LazyVGrid(columns: gridColumns,  content: {
            Image(systemName: suggestion.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)

            VStack(alignment:.leading, spacing: 6) {
                Text(suggestion.displayName)
                    .fontWeight(.medium)
                Text(suggestion.userName)
                    .fontWeight(.ultraLight)
            }

            Button(action: {
                isFollowed.toggle()
            }, label: {
                Text(isFollowed ? "Following" : "Follow")
            })
            .tint(isFollowed ? .gray : .blue)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 6))
        })
    }
}

#Preview {
    CustomModelExample()
}
