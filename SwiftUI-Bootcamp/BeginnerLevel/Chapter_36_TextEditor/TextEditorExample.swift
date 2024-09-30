//
//  TextEditorExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 10/09/24.
//

import SwiftUI

struct TextEditorExample: View {
    @State private var textEditorText = ""
    @State private var enableFeedbackButton: Bool = false
    private let messageMaxLength = 300

    var messageCurrentLength: Int {
        return textEditorText.count
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.opacity(0.8)
                    .ignoresSafeArea()

                VStack {
                    Text("")
                    TextEditor(text: $textEditorText)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(TextInputAutocapitalization(.words))
                        .font(.body)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .lineSpacing(15.0)
                        .border(.gray, width: 2)
                        .onChange(of: textEditorText, initial: true) { oldValue, newValue in
                            enableFeedbackButton = newValue.count > 0
                            if newValue.count > messageMaxLength {
                                textEditorText = String(newValue.prefix(messageMaxLength))
                            }
                        }

                    HStack {
                        Spacer()
                        Text("\(messageCurrentLength)/\(messageMaxLength)")
                            .foregroundStyle(.black.opacity(0.7))
                    }

                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Label("Send Feedback", image: "heart")
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    Capsule()
                                )
                        })
                        .disabled(!enableFeedbackButton)
                    }
                }
                .padding()
            }
            .navigationTitle("Send Feedback")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    TextEditorExample()
}
