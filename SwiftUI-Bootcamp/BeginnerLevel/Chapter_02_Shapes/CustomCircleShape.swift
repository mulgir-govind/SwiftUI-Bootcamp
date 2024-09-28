//
//  CustomCircleShape.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct CustomCircleShape: View {
    var body: some View {
//        Circle()
//            .trim(from: 0.0, to: 0.8)
//            .stroke(.purple, lineWidth: 30)
        
                Circle()
                    .fill(Color.pink)
        //            .stroke()
        //            .stroke(Color.red)
//                    .stroke(Color.yellow, lineWidth: 20)
                    .stroke(
                        Color.black,
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .round,
                            dash: [5]))
//                    .trim(from: 0.2, to: 1.0)
                    .padding(20)
    }
}

#Preview {
    CustomCircleShape()
}
