//
//  SliderExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 14/09/24.
//

import SwiftUI

enum VolumeStatus: String, CustomStringConvertible {
    case normal
    case high
    case low
    
    var description: String {
        switch self {
            case .normal:
                "Normal"
            case .high:
                "High"
            case .low:
                "Low"
        }
    }
}

struct SliderExample: View {
    @State private var volume: Double = 50
    @State private var volumeStatus: VolumeStatus = .normal
    @State private var sliderTintColor: Color = .green
    var body: some View {
        VStack(spacing: 20) {
            Text("Adjust volume")
                .font(.title)
            HStack {
                Text("\(String(format: "%.0f", volume))%")
                    .font(.title2)
                Text(volumeStatus.description)
            }

            Slider(value: $volume, in: 0 ... 100) {
                Text("Text label")
            } minimumValueLabel: {
                Text("0")
                    .font(.title2)
            } maximumValueLabel: {
                Text("100")
                    .font(.title2)
            } onEditingChanged: { valueChanged in
                switch volume {
                    case 0 ... 25:
                        volumeStatus = .low
                        sliderTintColor = .yellow
                    case 25...75:
                        volumeStatus = .normal
                        sliderTintColor = .green
                    case 75...100:
                        volumeStatus = .high
                        sliderTintColor = .red
                    default:
                        volumeStatus = .normal
                        sliderTintColor = .green
                }
            }
            .tint(sliderTintColor)
        }
        .padding()
    }
}

#Preview {
    SliderExample()
}
