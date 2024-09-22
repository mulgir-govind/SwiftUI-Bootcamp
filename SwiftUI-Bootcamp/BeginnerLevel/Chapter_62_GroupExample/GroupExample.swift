//
//  GroupExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 22/09/24.
//

import SwiftUI

struct GroupExample: View {
    let systemImages: [String] = [
        "dumbbell", "figure.walk", "oar.2.crossed", "tennis.racket",
        "soccerball.inverse", "basketball.circle.fill", "cricket.ball"
    ]
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // Group does not alter alignment/arrangement of subviews like VStack, HStack or ZStack.
                        // Group can be used to combine related subviews and apply common property modifiers
                        // to each of them instead of explicitly adding on each subview.
                        Group {
                            ForEach(0 ..< systemImages.count, id:\.self) { index in
                                Image(systemName: systemImages[index])
                                    .resizable()
                            }
                        }
                        .foregroundStyle(.primary)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1.0)
                        )
                        
                        Spacer()
                    }
                    .frame(width: proxy.size.width)
                }
            }
            .navigationTitle("Fitness symbols")
        }
    }
}

#Preview {
    GroupExample()
}
