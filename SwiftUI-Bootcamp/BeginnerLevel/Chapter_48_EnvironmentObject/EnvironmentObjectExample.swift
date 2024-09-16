//
//  EnvironmentObjectExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isLoggedIn: Bool = false
    static let userName: String = "Govind"

    func logIn() {
        isLoggedIn = true
    }

    func logOut() {
        isLoggedIn = false
    }
}

struct EnvironmentObjectExample: View {
    @StateObject private var auth: Authentication = Authentication()
    var body: some View {
        ZStack {
            if auth.isLoggedIn {
                HomeScreen()
            } else {
                LoginScreen()
            }
        }
        .environmentObject(auth)
    }
}

struct LoginScreen: View {
    @State private var pinText: String = ""
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var auth: Authentication

    var body: some View {
        VStack(alignment:.leading, spacing: 20) {
            VStack(alignment: .center) {
                Text("Login")
                    .font(.system(size: 34))
                    .bold()
            }
            .padding()
            .frame(maxWidth: .infinity)

            Text("Enter 4 digit pin for \(Authentication.userName)")
                .font(.title3)
            TextField(text: $pinText, prompt: Text("Enter pin")) {
                Text("Enter 4 digit pin for user - XYZ")
            }
            .keyboardType(.numberPad)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(colorScheme == .light ? .black : .white,
                            lineWidth: 2.0)
            )

            VStack(alignment: .trailing) {
                Button(action: {
                    auth.logIn()
                }, label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                        )
                })
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct MainScreen: View {
    var body: some View {
        HomeScreen()
    }
}

struct HomeScreen: View {
    @EnvironmentObject var auth: Authentication

    var body: some View {
        NavigationView {
            LazyVStack(alignment: .center) {
                Text("Welcome back")
                    .font(.body)
                    .bold()
                Text(Authentication.userName)
                    .font(.system(size: 64))
                    .bold()
                    .foregroundStyle(.clear)
                    .background(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .leading,
                            endPoint: .trailing)
                        .mask(Text("Govind")
                            .font(.system(size: 60, weight: .bold))
                        )
                    )
                
                Spacer()

                Button(action: {
                    auth.logOut()
                }, label: {
                    HStack {
                        Text("Logout")
                        Image(systemName: "arrow.right.circle.fill")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1.0)
                    )
                })
            }
        }
    }
}

#Preview {
    EnvironmentObjectExample()
}
