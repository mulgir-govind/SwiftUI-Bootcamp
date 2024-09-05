//
//  BindingPropertyWrapperDemo.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 05/09/24.
//

import SwiftUI

struct BindingPropertyWrapperDemo: View {
    @State private var selectedBackgroundColor: Color = .green
    @State private var colorOpacity: Double = 0.2
    var body: some View {
        ZStack {
            selectedBackgroundColor
                .opacity(colorOpacity)
                .ignoresSafeArea()
         
            VStack(spacing: 20) {
                CustomColorPickerView(backgroundColor: $selectedBackgroundColor)

                CustomColorOpacitySlider(colorOpacity: $colorOpacity)
            }
        }
    }
}

struct CustomColorPickerView: View {
    @Binding private(set) var backgroundColor: Color
    var body: some View {
        ColorPicker(selection: $backgroundColor, label: {
            Text("Select background color")
        })
        .padding()
        .frame(width: 300, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.white)
        )
        .shadow(radius: 10)
    }
}

struct CustomColorOpacitySlider: View {
    @Binding private(set) var colorOpacity: Double

    var body: some View {
        VStack(spacing: 10) {
            Text("Adjust color opacity:")
                .font(.body)
            
            Slider(value: $colorOpacity, in: 0.1 ... 0.9) {
                Text("Opacity: \(colorOpacity)")
            } minimumValueLabel: {
                Text("0.1")
            } maximumValueLabel: {
                Text("0.9")
            }
        }
        .padding()
        .frame(width: 300, height: 80)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.white)
        )
        .shadow(radius: 10)
    }
}

#Preview {
    BindingPropertyWrapperDemo()
}
