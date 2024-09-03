//
//  ButtonsExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 03/09/24.
//

import SwiftUI

struct ButtonsExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Button(action: {
                    print("First button pressed!")
                }, label: {
                    Text("First button")
                })
                
                Button {
                    print("Second button pressed!")
                } label: {
                    Text("Second button")
                        .font(.title)
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(.blue, lineWidth: 2.0)
                        )
                }
                
                Button {
                  // Some action
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                              LinearGradient(
                                colors: [ .cyan, .green],
                                startPoint: .leading,
                                endPoint: .trailing)
                            )

                        HStack(spacing: 20) {
                            Text("Proceed")
                            Image(systemName: "arrow.right")
                        }
                        .font(.system(size: 28))
                        .foregroundStyle(.white)
                    }
                    .frame(width: 300, height: 60)
                }

                Button(role: .destructive) {
                    print("Third destructive button tapped")
                } label: {
                    Label(
                        title: { Text("Delete") },
                        icon: { Image(systemName: "trash") }
                    )
                    .foregroundStyle(.white)
                    .font(.caption)
                    .bold()
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                    )
                }
                
                // Disable button
                Button(action: {
                    print("Disable button can't be tapped")
                }, label: {
                    Text("Disabled button")
                })
                .disabled(true)

                // Button with icon only.
                Button("Sign In", systemImage: "arrow.up", action: {})
                    .labelStyle(.iconOnly)
                    .foregroundStyle(.white)
                    .font(.system(size: 28))
                    .padding()
                    .background(
                        Circle()
                            .fill(.radialGradient(
                                colors: [.pink, .white],
                                center: .center,
                                startRadius: 5,
                                endRadius: 80))
                    )
                
                VStack(spacing: 30) {
                    Button(action: {}, label: {
                        Text("plain-button")
                    })
                    .buttonStyle(.plain)
                    
                    Button(action: {}, label: {
                        Text("Automatic-button")
                    })
                    .buttonStyle(.automatic)

                    Button(action: {}, label: {
                        Text("Bordered-button")
                    })
                    .buttonStyle(.bordered)

                    Button(action: {}, label: {
                        Text("Bordered-button")
                    })
                    .buttonStyle(.borderedProminent)

                    Button(action: {}, label: {
                        Text("Borderless-button")
                    })
                    .buttonStyle(.borderless)
                }
    //            .buttonStyle(.borderedProminent) // Set this on stack view to apply same button style to nested buttons.

                HStack(spacing: 10) {
                    Button("Cancel", role: .cancel) {}
                    Button("Delete", role: .destructive) {}
                    Button("Continue") {}
                }
                .buttonStyle(MyCustomButtonStye())
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct MyCustomButtonStye: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onTapGesture {
                configuration.trigger()
            }
            .font(configuration.role == .cancel ? .title2.bold() : .title2)
            .foregroundStyle(configuration.role == .destructive ? Color.red : Color.blue)
            .padding()
            .background(
                Capsule()
                    .stroke(
                        LinearGradient(colors: [.red, .green], startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 2.0)
            )
    }
}

#Preview {
    ButtonsExample()
}
