//
//  CustomCapsuleShape.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct CustomCapsuleShape: View {
    var body: some View {
        Capsule()
//            .fill(.purple)
            .stroke(Color.green, lineWidth: 5.0)
            .frame(width: 200, height: 50)
    }
}

#Preview {
    CustomCapsuleShape()
}
