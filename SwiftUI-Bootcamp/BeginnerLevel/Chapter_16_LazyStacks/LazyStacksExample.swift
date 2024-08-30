//
//  LazyStacksExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 30/08/24.
//

import SwiftUI

struct LazyStacksExample: View {
    var body: some View {
        ScrollView {
            // Without lazy stack, VStack will try load all 10000 text view before rending any view,
            // thus which takes upto 650 MB of memory space.
//            VStack {
//                ForEach(0 ..< 10000) { index in
//                    Text("Item: \(index)")
//                        .foregroundStyle(.black)
//                }
//            }

            // With Lazy stack, it loads only text view which will be visible on the screen
            // thus have low memory consumption and performance improvement.
            LazyVStack {
                ForEach(0 ..< 10000) { index in
                    Text("Item: \(index)")
                        .foregroundStyle(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 400)

        ScrollView(.horizontal) {
//            HStack {
//                ForEach(0 ..< 10000) { index in
//                    Text("Item: \(index)")
//                        .foregroundStyle(.black)
//                        .fixedSize()
//                }
//            }

            LazyHStack {
                ForEach(0 ..< 10000) { index in
                    Text("Item: \(index)")
                        .foregroundStyle(.black)
                        .fixedSize()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
    }
}

#Preview {
    LazyStacksExample()
}
