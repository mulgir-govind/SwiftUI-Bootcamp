//
//  ExtractingSubviewsExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 05/09/24.
//

import SwiftUI

struct ExtractingSubviewsExample: View {
    @State private var userName: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Local view property
                logo
                    .padding()

                CustomTextFieldView(userName: $userName)
                    .padding(.horizontal)

                CustomSecureTextField(password: $password)
                    .padding(.horizontal)

                // Local view property
                loginButton
                    .padding(.vertical)
            }
        }
    }

    // Local view property
    private var logo: some View {
        Image(systemName: "baseball.diamond.bases")
            .font(.system(size: 40))
            .foregroundStyle(.red)
            .background(
                Circle()
                    .stroke(
                        LinearGradient(colors: [.black, .purple], startPoint: .leading, endPoint: .trailing),
                        lineWidth: 6.0
                    )
                    .fill(
                        LinearGradient(
                            colors: [.gray.opacity(0.2), .yellow.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 80, height: 80)
            )
    }
    
    private var loginButton: some View {
        Button(action: {}, label: {
            Text("Login".uppercased())
                .frame(width: 100, height: 30)
        })
        .buttonStyle(.borderedProminent)
    }
}

struct CustomSecureTextField: View {
    @Binding private(set) var password: String
    var body: some View {
        SecureField("Enter password", text: $password)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2.0)
            )
    }
}

struct CustomTextFieldView: View {
    @Binding private(set) var userName: String;
    var body: some View {
        TextField("Enter username", text: $userName)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2.0)
            )
    }
}

#Preview {
    ExtractingSubviewsExample()
}
