//
//  SafeAreaInsetExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 22/09/24.
//

import SwiftUI

struct SafeAreaInsetExample: View {
    @State var colors: [Color] = [ .blue, .green, .red, .yellow, .purple]
    @State var showNotification: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0 ..< colors.count, id:\.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colors[item])
                            .frame(height: 300)

                            // Add thin layer using background material
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.ultraThinMaterial)
                                .overlay {
                                    Text("Color \(item + 1)")
                                }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("SafeAreaInset example")
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                Button(action: {
                    addNewColor()
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
                .tint(.black)
                .buttonBorderShape(.circle)
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .padding()
                .shadow(radius: 10)
            }
            .safeAreaInset(edge: .top) {
                if showNotification {
                    NotificationBadge(showNotification: $showNotification)
                        .transition(.opacity)
                        .shadow(radius: 10, y: 10)
                }
            }
        }
    }

    func addNewColor() {
        withAnimation {
            colors.insert(randomColor(), at: 0)
            showNotification = true
        }
    }

    func randomColor() -> Color {
        Color(red: Double.random(in: 0...255) / 255,
              green: Double.random(in: 0...255) / 255,
              blue: Double.random(in: 0...255) / 255)
    }
}

struct NotificationBadge: View {
    @Binding var showNotification: Bool
    var body: some View {
        ZStack {
            HStack {
                Text("🔔 New color added")
                    .font(.headline)
                    .foregroundColor(.white)
                Button(action: {
                    withAnimation {
                        showNotification = false
                    }
                }, label: {
                    Text("Dismiss")
                        .foregroundStyle(.white)
                })
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        .padding([.top, .horizontal])
        }
    }
}

#Preview {
    SafeAreaInsetExample()
}
