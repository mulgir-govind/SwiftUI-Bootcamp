//
//  ContextMenuExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 08/09/24.
//

import SwiftUI

struct ContextMenuExample: View {
    var body: some View {
        VStack {
            Text("Long press on this message to show context menu")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
                .background(.gray)
                .contextMenu(ContextMenu(menuItems: {
                    Button(action: {}, label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    })
                    Button(action: {}, label: {
                        Text("Select all")
                    })

                    // Add divider for separating the group of items
                    Divider()

                    // Add nested menu action
                    Menu {
                        Button(action: {}, label: {
                            Label("Airdrop", systemImage: "antenna.radiowaves.left.and.right")
                        })
                        Button(action: {}, label: {
                            Label("Message", systemImage: "message")
                        })
                        Button(action: {}, label: {
                            Label("Email", systemImage: "tray")
                        })
                    } label: {
                        Label("Share via", systemImage: "square.and.arrow.up")
                    }

                }))
        }
        .padding()
    }
}

#Preview {
    ContextMenuExample()
}
