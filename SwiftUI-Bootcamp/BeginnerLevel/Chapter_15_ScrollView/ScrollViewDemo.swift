//
//  ScrollViewDemo.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 30/08/24.
//

import SwiftUI

struct IconItem: Identifiable {
    let id = UUID()
    let name: String
    let caption: String
    var color: Color = .blue
}

struct IconSection: Identifiable {
    let id = UUID()
    let title: String
    let icons: [IconItem]
    var sectionColor: Color = .primary
}

struct ScrollViewDemo: View {
    let sections: [IconSection] = [
        IconSection(
            title: "Communication",
            icons: [
                IconItem(name: "phone.fill", caption: "Phone"),
                IconItem(name: "message.fill", caption: "Message"),
                IconItem(name: "envelope.fill", caption: "Mail"),
                IconItem(name: "bubble.left.fill", caption: "Chat"),
                IconItem(name: "person.crop.circle.fill", caption: "Profile"),
                IconItem(name: "mic.fill", caption: "Voice")
            ]
        ),
        IconSection(
            title: "Utility",
            icons: [
                IconItem(name: "wrench.fill", caption: "Tools", color: .orange),
                IconItem(name: "gearshape.fill", caption: "Settings", color: .gray),
                IconItem(name: "scissors", caption: "Cut", color: .red),
                IconItem(name: "folder.fill", caption: "Folder", color: .yellow),
                IconItem(name: "paperclip", caption: "Attach", color: .blue),
                IconItem(name: "calendar", caption: "Calendar", color: .green)
            ],
            sectionColor: .blue
        ),
        IconSection(
            title: "Transport",
            icons: [
                IconItem(name: "car.fill", caption: "Car", color: .blue),
                IconItem(name: "bicycle", caption: "Bike", color: .green),
                IconItem(name: "airplane", caption: "Airplane", color: .purple),
                IconItem(name: "bus.fill", caption: "Bus", color: .orange),
                IconItem(name: "tram.fill", caption: "Tram", color: .red),
                IconItem(name: "train.side.front.car", caption: "Train", color: .gray)
            ],
            sectionColor: .purple // Section color (can be used for section headers, backgrounds, etc.)
        ),
        IconSection(
            title: "Media",
            icons: [
                IconItem(name: "photo.fill", caption: "Photo"),
                IconItem(name: "video.fill", caption: "Video"),
                IconItem(name: "music.note", caption: "Music"),
                IconItem(name: "tv.fill", caption: "TV"),
                IconItem(name: "play.rectangle.fill", caption: "Play"),
                IconItem(name: "headphones", caption: "Headphones")
            ]
        ),
        IconSection(
            title: "Weather",
            icons: [
                IconItem(name: "cloud.fill", caption: "Cloud"),
                IconItem(name: "sun.max.fill", caption: "Sunny"),
                IconItem(name: "snowflake", caption: "Snowflake"),
                IconItem(name: "cloud.rain.fill", caption: "Rain"),
                IconItem(name: "wind", caption: "Wind"),
                IconItem(name: "thermometer.sun.fill", caption: "Hot")
            ]
        )
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(sections) { section in
                    Text(section.title)
                        .font(.title)
                        .foregroundStyle(section.sectionColor)
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(section.icons) { icon in
                                VStack {
                                    Image(systemName: icon.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(icon.color)

                                    Text(icon.caption)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .defaultScrollAnchor(.leading)
//                    .scrollClipDisabled(false)
                }
            }
        }
//        .defaultScrollAnchor(.center)
//        .scrollClipDisabled(true)
    }
}

#Preview {
    ScrollViewDemo()
}
