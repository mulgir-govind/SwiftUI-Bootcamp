//
//  CustomRectangleShape.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 25/08/24.
//

import SwiftUI

struct CustomRectangleShape: View {
    var body: some View {
        Rectangle()
            .fill(.blue)
            .stroke(.black, lineWidth: 5)
            .frame(width: 200, height: 100)
        
        RoundedRectangle(cornerRadius: 20)
            .fill(.gray)
            .frame(width: 80, height: 100)
    }
}

#Preview {
    CustomRectangleShape()
}
