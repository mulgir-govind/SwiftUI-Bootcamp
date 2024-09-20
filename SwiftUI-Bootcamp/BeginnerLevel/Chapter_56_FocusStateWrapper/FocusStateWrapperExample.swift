//
//  FocusStateWrapperExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 20/09/24.
//

import SwiftUI

struct FocusStateWrapperExample: View {
    var body: some View {
        TabView {
            FocusStateWrapperApproachOne()
                .tabItem {
                    Text("Approach 1")
                    Image(systemName: "1.circle")
                }
            
            FocusStateWrapperApproachTwo()
                .tabItem {
                    Text("Approach 2")
                    Image(systemName: "2.circle")
                }
        }
        .tint(.red)
    }
}

struct FocusStateWrapperApproachOne: View {
    @State private var userName: String = ""
    @FocusState private var isUserNameFocused: Bool

    @State private var password: String = ""
    @FocusState private var isPasswordFocused: Bool

    var body: some View {
        NavigationView {
            VStack {
                TextField("User name", text: $userName)
                    .focused($isUserNameFocused)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(
                                isUserNameFocused ? Color.red : Color.black,
                                lineWidth: 2.0
                            )
                    )
                    .padding()
                SecureField("Password", text: $password)
                    .focused($isPasswordFocused)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(
                                isPasswordFocused ? Color.red : Color.black,
                                lineWidth: 2.0
                            )
                    )
                    .padding()
                
                Button(action: {
                    let isUserNameEmpty = userName.isEmpty
                    let isPasswordEmpty = password.isEmpty
                    
                    if !isUserNameEmpty && !isPasswordEmpty {
                        print("Logged in")
                    }
                    
                    if isUserNameEmpty {
                        isUserNameFocused = true
                        isPasswordFocused = false
                    } else if isPasswordEmpty {
                        isUserNameFocused = false
                        isPasswordFocused = true
                    }
                }, label: {
                    Text("Login")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
            }
            .navigationTitle("Approach one")
            .onAppear(perform: {
                isUserNameFocused = true
            })
        }
    }
}

struct FocusStateWrapperApproachTwo: View {
    enum LoginField: Hashable {
        case userNameField
        case passwordField
    }

    @State private var userName: String = ""
    @State private var password: String = ""
    @FocusState private var loginField: LoginField?

    var body: some View {
        NavigationView {
            VStack {
                TextField("User name", text: $userName)
                    .focused($loginField, equals: .userNameField)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2.0)
                    )
                    .padding()
                SecureField("Password", text: $password)
                    .focused($loginField, equals: .passwordField)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2.0)
                    )
                    .padding()
                
                Button(action: {
                    let isUserNameEmpty = userName.isEmpty
                    let isPasswordEmpty = password.isEmpty
                    
                    if !isUserNameEmpty && !isPasswordEmpty {
                        print("Logged in")
                    }

                    if isUserNameEmpty {
                        loginField = .userNameField
                    } else if isPasswordEmpty {
                        loginField = .passwordField
                    }
                }, label: {
                    Text("Login")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
            }
            .navigationTitle("Approach two")
        }
    }
}

#Preview {
    FocusStateWrapperExample()
}
