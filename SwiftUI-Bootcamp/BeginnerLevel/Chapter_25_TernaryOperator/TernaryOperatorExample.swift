//
//  TernaryOperatorExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 05/09/24.
//

import SwiftUI

struct TernaryOperatorExample: View {
    @State private var isLiked: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Use the ternary operator to set the button text and color
            Button(action: {
                // Toggle the state
                isLiked.toggle()
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(isLiked ? Color.red : Color.gray)
                    .cornerRadius(10)
            }

            // Display the status of "Liked" or "Not Liked" using ternary
            Text(isLiked ? "You liked this" : "You haven't liked this yet")
                .font(.headline)
                .foregroundColor(isLiked ? .red : .gray)
        }
        .padding()
    }
}

#Preview {
    TernaryOperatorExample()
}
