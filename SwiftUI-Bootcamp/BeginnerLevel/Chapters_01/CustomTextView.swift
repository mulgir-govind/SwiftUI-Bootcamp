//
//  CustomTextView.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct CustomTextView: View {
    var body: some View {
        Text("Starting SwiftUI learning course with beginner level.".capitalized)
            .background(Color.black)
            .foregroundStyle(.green)
//            .font(.body)
            .font(.system(size: 20))
            .fontDesign(.rounded)
            .lineLimit(2)
            .lineSpacing(15)
            .kerning(1)
            .multilineTextAlignment(.center)
            .fontWeight(.semibold)
            .underline(pattern: .dash, color: .red)
            .strikethrough(pattern:.dashDotDot, color: .yellow)
            .baselineOffset(10)
//            .baselineOffset(-10)
            .frame(width: 400, height: 400, alignment: .center)
    }
}

#Preview {
    CustomTextView()
}
