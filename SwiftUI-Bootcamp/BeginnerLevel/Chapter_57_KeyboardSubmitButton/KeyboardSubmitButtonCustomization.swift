//
//  KeyboardSubmitButtonCustomization.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 20/09/24.
//

import SwiftUI

struct KeyboardSubmitButtonCustomization: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var showProgressView: Bool = false
    @FocusState private var isPasswordFocused: Bool
    var body: some View {
        VStack {
            TextField("Enter email id", text: $userName)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2.0)
                )
                .padding()
                .keyboardType(.emailAddress)
                .submitLabel(.next) // Next button in keyboard
                .onSubmit {
                    isPasswordFocused = true
                }

            SecureField("Enter password", text: $password)
                .focused($isPasswordFocused)
                .keyboardType(.default)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2.0)
                )
                .padding()
                .submitLabel(.send) // Send button in keyboard
                .onSubmit {
                    withAnimation {
                        showProgressView = true
                    }
                }

            if showProgressView {
                ProgressView {
                    Text("Login...")
                }
                .controlSize(.extraLarge)
                .tint(.red)
            }
        }
        .padding()
    }
}

#Preview {
    KeyboardSubmitButtonCustomization()
}
