//
//  ImagesDemo.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct ImagesDemo: View {
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 400)
            .clipShape(
                Circle()
//                Ellipse()
//                Capsule()
            )
        Image("dog")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 220)
            .clipShape(
                Capsule()
            )
    }
}

#Preview {
    ImagesDemo()
}
