//
//  ToolbarExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import SwiftUI

struct ToolbarExample: View {
    @State private var path = NavigationPath()
    @State private var backgroundColor: Color = .white
    @State private var searchText: String = ""
    @State private var showClearKeyboardButton: Bool = false
    var body: some View {
        ZStack {
            NavigationStack(path: $path) {
                VStack {
                    TextField("Enter some text...", text: $searchText)
                        .padding()
                        .textFieldStyle(.plain)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2.0)
                        )
                        .padding()
                }
                ScrollView {
                    VStack {
                        ForEach(0 ..< 5) { item in
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.pink.opacity(0.2))
                                .frame(width: 300, height: 300)

                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.yellow.opacity(0.2))
                                    .frame(width: 300, height: 300)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .toolbar {
                        ToolbarItem(placement: .navigation) {
                            Button("Change BG") {
                                backgroundColor = Bool.random() ? .black : .white
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {}, label: {
                                Image(systemName: "gear")
                            })
                        }

                        // Added horizontal scrollable view in bottom bar
                        ToolbarItem(placement: .bottomBar) {
                            ScrollView(.horizontal ,showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< 5) { item in
                                        Button(action: {}, label: {
                                            Text("#Hashtag\(item + 1)")
                                        })
                                        .buttonStyle(.borderedProminent)
                                    }
                                }
                            }
                        }

//                        ToolbarItem(placement: .bottomBar) {
//                            Button("Bottom bar button 1") {
//                                backgroundColor = .blue
//                            }
//                            .buttonStyle(.borderedProminent)
//                        }
//
//                        ToolbarItem(placement: .bottomBar) {
//                            Button("Bottom bar button 2") {
//                                backgroundColor = .green
//                            }
//                            .buttonStyle(.borderedProminent)
//                            .buttonBorderShape(.capsule)
//                        }

                        // Toolbar item show on keyboard bar when textfield is editing
                        ToolbarItem(placement: .keyboard) {
                            Button {
                                searchText = ""
                            } label: {
                                Label("Clear", systemImage: "xmark.circle")
                            }
                        }
                    }
                }
                .navigationTitle("Toolbar demo")
                .navigationBarTitleDisplayMode(.inline)
                // Show additional menu at nav bar title
                .toolbarTitleMenu {
                    Button("Green screen") {
                        path.append(Color.green)
                    }

                    Button("Number screen") {
                        path.append(17)
                    }
                }
                .navigationDestination(for: Color.self) { color in
                    ZStack {
                        color.ignoresSafeArea()
                    }
                }
                .navigationDestination(for: Int.self) { number in
                    VStack {
                        Text("\(number)")
                    }
                }
            }
        }
    }
}

#Preview {
    ToolbarExample()
}
