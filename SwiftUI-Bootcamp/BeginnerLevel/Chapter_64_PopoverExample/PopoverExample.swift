//
//  PopoverExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 22/09/24.
//

import SwiftUI

struct PopoverExample: View {
    let messages: [String] = [
        "I will reach in 5 mins",
        "Just wrapped office stuff, will book a cap and will be there in 20 mins"
    ]
    @State var newMessage: String = ""
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()

            ScrollView {
                LazyVStack(alignment: .leading) {
                    Spacer()
                    ForEach(0 ..< messages.count, id: \.self) { index in
                        MessageView(message: messages[index])
                    }
                }
            }
            .background(.ultraThinMaterial)
            .safeAreaInset(edge: .bottom) {
                TextEditor(text: $newMessage)
                    .textEditorStyle(.plain)
                    .frame(width: 300, height: 40)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.0)
                    )
                    .padding()
            }
        }
    }
}

struct MessageView: View {
    var message: String
    @State var showPopover: Bool = false
    @State var selectedEmojiReply: String? = nil
    let quickEmojiReplies: [String] = ["🤣", "👍", "😡"]

    var body: some View {
        ZStack {
            Group {
                Text(message)
                    .font(.body)
                    .fontWeight(.light)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green.opacity(0.6))
                    )
                    .onLongPressGesture(perform: {
                        withAnimation {
                            showPopover = true
                        }
                    })
                    .safeAreaInset(edge: .bottom ,alignment: .trailing) {
                        if let selectedEmojiReply = selectedEmojiReply {
                            Button(selectedEmojiReply) {
                                withAnimation {
                                    showPopover = true
                                }
                            }
                            .buttonBorderShape(.circle)
                            .controlSize(.regular)
                            .buttonStyle(.bordered)
                            .offset(y: -20)
                        }
                }
            }
            .padding()
        }
        .popover(isPresented: $showPopover, attachmentAnchor: .point(.top)) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< quickEmojiReplies.count, id:\.self) { index in
                        let emojiReply = quickEmojiReplies[index]
                        Button(emojiReply) {
                            didSelectEmojiReply(emojiReply)
                        }
                        .padding(.all, 4)
                        .buttonStyle(.plain)
                    }
                }
            }
            .presentationCompactAdaptation(.popover)
        }
    }
    
    func didSelectEmojiReply(_ reply: String) {
        withAnimation {
            selectedEmojiReply = reply == selectedEmojiReply ? nil : reply
            showPopover = false
        }
    }
}

#Preview {
    PopoverExample()
}
