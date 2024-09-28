//
//  IconDemo.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct IconDemo: View {
    var body: some View {
        Text("Outlined icon:")
        Image(systemName: "heart") // Use Apples's SF Symbol tool to find such icons
            .foregroundStyle(.red)
            .font(.largeTitle)

        Text("Filled icon:")
        Image(systemName: "heart.fill")
            .foregroundStyle(.red)
            .font(.largeTitle)
        
        Text("Fixed size icon:")
        Image(systemName: "house")
            .font(.system(size: 40))
            .foregroundStyle(.blue)

        Text("Resizable icon:")
        Image(systemName: "trash.fill")
            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .scaledToFill()
            .scaledToFit()
            .foregroundStyle(.pink)
            .frame(width: 100, height: 100)
//            .clipped()

        Text("Multi-color icon:")
        Image(systemName: "folder.fill.badge.plus")
            .renderingMode(.original)
            .foregroundStyle(.red)
            .font(.largeTitle)
    }
}

#Preview {
    IconDemo()
}
