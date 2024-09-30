//
//  CustomEllipseShape.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct CustomEllipseShape: View {
    var body: some View {
        Ellipse()
//            .trim(from: 0.2, to: 1.0)
            .fill(Color.yellow)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 200, height: 100)
    }
}

#Preview {
    CustomEllipseShape()
}
