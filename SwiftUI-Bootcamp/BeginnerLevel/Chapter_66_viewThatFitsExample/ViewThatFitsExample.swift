//
//  ViewThatFitsExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 24/09/24.
//

import SwiftUI

struct ViewThatFitsExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("For large area:")
            WeatherView()
                .frame(width: 300)

            Divider()

            Text("For compact area:")
            WeatherView()
                .frame(width: 100)
        }
        .padding()
    }
}

struct WeatherView: View {
    var body: some View {
        ViewThatFits {
            // For large area
            HStack {
                VStack(alignment: .leading) {
                    Text("Pune")
                        .font(.largeTitle)
                        .bold()
                    Text("Rainy")
                        .font(.subheadline)
                    Text("High: 24°C, Low: 30°C")
                        .font(.subheadline)
                }
                .foregroundStyle(.black)
                Spacer()
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
            }
            .padding(.all, 8)
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            .shadow(radius: 10)

            // For small area
            VStack {
                Text("Pune")
                    .font(.title)
                    .bold()
                HStack {
                    Text("24°C")
                        .font(.subheadline)
                    Image(systemName: "cloud.rain.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
            .foregroundStyle(.black)
            .padding(.all, 4)
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            .shadow(radius: 10)
        }
    }
}

#Preview {
    ViewThatFitsExample()
}
