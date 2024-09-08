//
//  TextFieldExamples.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 08/09/24.
//

import SwiftUI

struct TextFieldExamples: View {
    @State private var email: String = ""
    @State private var emailFieldBorderColor: Color = .black
    @State private var isEmailAddressValid: Bool = false
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                TextField("Enter your email", text: $email)
                    .onChange(of: email, { oldValue, newValue in
                        isEmailAddressValid = isValidEmail(newValue)
                        emailFieldBorderColor = isEmailAddressValid ? .green : .red
                    })
                .keyboardType(.emailAddress)
                // .textFieldStyle(.roundedBorder)
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .stroke(emailFieldBorderColor, lineWidth: 3)
                )

                Button(action: {
                    showAlert = true
                }, label: {
                    Text("Send OTP")
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 5))
                })
                .disabled(!isEmailAddressValid)
                Spacer()
            }
            .alert("OTP sent", isPresented: $showAlert, actions: {})
            .navigationTitle("Reset password")
            .padding()
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    TextFieldExamples()
}
