//
//  GradientsDemo.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct GradientsDemo: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 103.0 / 255, green: 65.0 / 255, blue: 136.0 / 255, opacity: 1.0),
                        Color(red: 200.0 / 255, green: 161.0 / 255, blue: 224.0 / 255, opacity: 0.5)
                    ],
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading)
            )
            .frame(width:300, height: 180)
        
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                RadialGradient(
                    colors: [
                        Color(red: 56 / 255, green: 127 / 255, blue: 57 / 255, opacity: 1.0),
                        Color(red: 162 / 255, green: 202 / 255, blue: 113 / 255, opacity: 0.5)
                    ],
                    center: .center,
                    startRadius: 0,
                    endRadius: 300)
            )
            .frame(width:300, height: 180)
        
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                AngularGradient(
                    colors: [
                        Color(red: 255 / 255, green: 154 / 255, blue: 0 / 255, opacity: 0.5),
                        Color(red: 103.0 / 255, green: 65.0 / 255, blue: 136.0 / 255, opacity: 1.0),
                    ],
                    center: .center,
                    angle: Angle(degrees: 45))
//                AngularGradient.init(
//                    gradient: Gradient(colors: [
//                        Color(red: 255 / 255, green: 154 / 255, blue: 0 / 255, opacity: 0.5),
//                        Color(red: 103.0 / 255, green: 65.0 / 255, blue: 136.0 / 255, opacity: 1.0),
//                    ]),
//                    center: .center,
//                    angle: .degrees(45))
            )
            .frame(width:300, height: 180)

        Capsule()
            .fill(
                .linearGradient(
                    colors: [.purple, .blue, .green, .orange, .red],
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .frame(width: 200, height: 80)
    }
}

#Preview {
    GradientsDemo()
}
