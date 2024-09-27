//
//  ControlGroupExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 26/09/24.
//

import SwiftUI

struct ControlGroupExample: View {
    @State private var textAlignment: TextAlignment = .leading
    @State private var backgroundColor: Color = .green
    @State private var fontSize: CGFloat = 24
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                backgroundColor.opacity(0.5).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {
                        Group {
                            Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.")
                            
                            Text("SwiftUI uses a declarative syntax, so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.")
                        }
                        .font(.system(size: fontSize))
                        .multilineTextAlignment(textAlignment)
                        .padding()
                        .animation(.easeInOut, value: textAlignment)
                        .animation(.easeIn, value: fontSize)
                    }
                }
                .safeAreaInset(edge: .bottom, alignment:.trailing) {
                    Menu {
                        Button(action: {
                            withAnimation {
                                backgroundColor = .green
                                textAlignment = .leading
                                fontSize = 24
                            }
                        }, label: {
                            Label("Reset setting", systemImage: "gear")
                        })
                        ControlGroup("Background color") {
                            Button(action: {
                                backgroundColor = .red
                            }, label: {
                                Text("Red")
                            })
                            Button(action: {
                                backgroundColor = .yellow
                            }, label: {
                                Text("Yellow")
                            })
                            Button(action: {
                                backgroundColor = .purple
                            }, label: {
                                Text("Purple")
                            })
                        }
                        ControlGroup("Text alignment") {
                            Button(action: {
                                textAlignment = .leading
                            }, label: {
                                Image(systemName: "text.alignleft")
                            })
                            
                            Button(action: {
                                textAlignment = .center
                            }, label: {
                                Image(systemName: "text.aligncenter")
                            })
                            
                            Button(action: {
                                textAlignment = .trailing
                            }, label: {
                                Image(systemName: "text.alignright")
                            })
                        }
                    } label: {
                        Button(action: {}, label: {
                            Image(systemName: "pencil")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                        })
                        .buttonBorderShape(.circle)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                }
                .safeAreaInset(edge: .bottom, content: {
                    ControlGroup("Font size: \(fontSize)") {
                        Button(action: {
                            fontSize = (fontSize - 1) < 10 ? 10 : (fontSize - 1)
                        }) {
                            Label("Decrease", systemImage: "minus")
                        }
                        .foregroundStyle(.white)
                        .tint(.white)

                        Button(action: {
                            fontSize = (fontSize + 1) > 30 ? 30 : (fontSize + 1)
                        }) {
                            Label("Increase", systemImage: "plus")
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.thickMaterial)
                    }
                    .padding()
                })
                .navigationTitle("SwiftUI")
            }
        }
    }
}

#Preview {
    ControlGroupExample()
}
