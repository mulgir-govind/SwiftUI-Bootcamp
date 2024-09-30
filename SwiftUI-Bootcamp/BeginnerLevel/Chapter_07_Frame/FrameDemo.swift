//
//  FrameDemo.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 27/08/24.
//

import SwiftUI

struct FrameDemo: View {
    var body: some View {
        Text("Left aligned text")
            .background(Color.red)
            .frame(maxWidth: .infinity, alignment: .leading)
        // maxWidth/maxHeight = infinity will take all available space
        // from parent view.

        Text("Center aligned text")
            .background(Color.pink)
            .frame(maxWidth: .infinity, alignment: .center)

        Text("Right aligned text")
            .background(Color.pink)
            .frame(maxWidth: .infinity, alignment: .trailing)

        // You can set multiple frame with different sizes.
        Text("Multi-frame text")
            .background(Color.yellow)
            .frame(width: 200)
            .background(Color.blue)
            .frame(height: 200)
            .background(Color.green)
    }
}

#Preview {
    FrameDemo()
}
