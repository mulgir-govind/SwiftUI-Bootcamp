//
//  ButtonStyleExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 19/09/24.
//

import SwiftUI

struct ButtonStyleExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Button(action: {}, label: {
                    Text("No style button")
                })

                Button(action: {}, label: {
                    Text("Automatic style button")
                })
                .buttonStyle(.automatic)

                Button(action: {}, label: {
                    Text("Bordered style button")
                })
                .buttonStyle(.bordered)

                Button(action: {}, label: {
                    Text("Bordered Prominent style button")
                })
                .buttonStyle(.borderedProminent)
                
                Button(action: {}, label: {
                    Text("Plain style button")
                })
                .buttonStyle(.plain)
                
                Button(action: {}, label: {
                    Text("Mini size button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.small)

                Button(action: {}, label: {
                    Text("Small size button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.small)

                Button(action: {}, label: {
                    Text("Regular size button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                
                Button(action: {}, label: {
                    Text("Large size button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                Button(action: {}, label: {
                    Text("Extra large size button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                
                Button(action: {}, label: {
                    Text("Frame max width sized button")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                
                Button(action: {}, label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.circle)

                Button(action: {}, label: {
                    Text("Capsule shape button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.capsule)
                
                Button(action: {}, label: {
                    Text("Rounded rectangle shape button")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle(radius: 20))
            }
        }
    }
}

#Preview {
    ButtonStyleExample()
}
