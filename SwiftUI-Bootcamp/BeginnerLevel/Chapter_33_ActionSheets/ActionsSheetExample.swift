//
//  ActionsSheetExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 08/09/24.
//

import SwiftUI

struct ActionsSheetExample: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.white.opacity(0.9)
                    .ignoresSafeArea()
                    .navigationTitle("Recent posts")

                ScrollView {
                    VStack(spacing: 20) {
                        PostView()
                    }
                }
            }
        }
    }
}

struct PostView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                    .overlay(
                        Text("video placeholder")
                            .foregroundStyle(.gray)
                    )

                PostLikesCommentView()
                    .padding(.horizontal, 6)
            }

            PostUserView()
                .padding(.all, 6)
        }
    }
}

struct PostUserView: View {
    @State private var showActionSheet: Bool = false
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "person.circle")
                    .font(.system(size: 40))
                Text("User name")
                    .fontWeight(.bold)
            })

            Spacer()
            Button(action: {
                showActionSheet.toggle()
            }, label: {
                Image(systemName: "ellipsis")
            })
            .actionSheet(isPresented: $showActionSheet, content: {
                let hideButton: Alert.Button = .default(Text("Hide")) {
                        // Hide post action
                    }
                let reportButton: Alert.Button = .destructive(Text("Report")) {
                    // Report post action
                }
                let cancelButton: Alert.Button = .cancel()
                return ActionSheet(
                    title: Text("Extra actions"),
                    message: Text("You can perform take extra action for this post"),
                    buttons: [ hideButton,  reportButton, cancelButton]
                )
            })
        }
        .font(.title2)
        .tint(.black)
    }
}

struct PostLikesCommentView: View {
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {}, label: {
                Image(systemName: "heart")
            })
            Button(action: {}, label: {
                Image(systemName: "message")
            })
            Button(action: {}, label: {
                Image(systemName: "paperplane")
            })

            Spacer()
            Button(action: {}, label: {
                Image(systemName: "square.and.arrow.down")
            })
        }
        .tint(.black)
        .font(.title2)
    }
}

#Preview {
    ActionsSheetExample()
}
