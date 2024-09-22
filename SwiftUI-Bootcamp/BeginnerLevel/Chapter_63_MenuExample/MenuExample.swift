//
//  MenuExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 22/09/24.
//

import SwiftUI

struct MenuExample: View {
    @State var users: [String] = [
        "Virat", "Mahendra", "Ravindra", "Sachin",
        "Rohit", "Hardik"
    ].sorted()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(0 ..< users.count, id:\.self) { index in
                        HStack(spacing: 20) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 24, height: 24)

                            Text(users[index])
                        }
                    }
                } header: {
                    HStack {
                        Text("Followers")
                        Spacer()
                        
                        Menu {
                            Button(action: {
                                withAnimation {
                                    users = users.sorted(by: < )
                                }
                            }, label: {
                                Text("A-Z")
                            })
                            Button(action: {
                                withAnimation {
                                    users = users.sorted(by: > )
                                }
                            }, label: {
                                Text("Z-A")
                            })
                        } label: {
                            Label("Sort", systemImage: "arrow.up.arrow.down")
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1.0)
                                )
                        }
                    }
                }
            }
            .navigationTitle("Menu example")
        }
    }
}

#Preview {
    MenuExample()
}
