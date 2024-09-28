//
//  ColorsDemoView.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct ColorsDemoView: View {
    var body: some View {
        Text("Fixed Color. It does not changes in dark and light mode")
            .multilineTextAlignment(.center)
            .font(.body)
            .fontWeight(.bold)

        RoundedRectangle(cornerRadius: 25.0)
//            .fill(.primary)
            .fill(.pink)
//            .fill(Color(uiColor: UIColor.gray))
            .frame(width:300, height: 200)

        // Separator line
        Rectangle()
            .frame(height:2)

        Text("Custom color from Asset. It is set different for dark and light mode")
            .multilineTextAlignment(.center)
            .font(.body)
            .fontWeight(.bold)

        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color("CustomColor"))
            .frame(width:300, height: 200)
    }
}

#Preview {
    ColorsDemoView()
}
