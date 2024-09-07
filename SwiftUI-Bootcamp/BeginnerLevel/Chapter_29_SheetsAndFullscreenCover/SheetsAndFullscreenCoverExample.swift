//
//  SheetsAndFullscreenCoverExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 07/09/24.
//

import SwiftUI

struct SheetsAndFullscreenCoverExample: View {
    @State private var showNextScreen: Bool = false
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)

            VStack {
                Button(action: {
                    showNextScreen.toggle()
                }, label: {
                    Text("Next screen")
                        .padding()
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10.0)
                        )
                })
            }
            // Use either `.sheet` or `fullScreenCover` and NOT both of them
            
            .sheet(isPresented: $showNextScreen, content: {
                // DON'T ADD CONDITIONAL CONTENT HERE
                GreenSheetView()
            })
//            .fullScreenCover(isPresented: $showNextScreen, content: {
//                // DON'T ADD CONDITIONAL CONTENT HERE
//                PinkSheetView()
//            })
        }
        .ignoresSafeArea()
    }
}

struct GreenSheetView: View {
    // Deprecated property wrapper
    // @Environment(\.presentationMode) var presentationMode

    // New API for presentation & dismiss
    @Environment(\.dismiss) var dismissScreen
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.5)
            
            VStack {
                Button(action: {
                    // Deprecated API
                    // presentationMode.wrappedValue.dismiss()

                    // New API
                    dismissScreen()
                }, label: {
                    Text("Close Green sheet")
                        .padding()
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10.0)
                        )
                })
            }
        }
        .ignoresSafeArea()
    }
}

struct PinkSheetView: View {
    // Deprecated property wrapper
    // @Environment(\.presentationMode) var presentationMode

    // New API for presentation & dismiss
    @Environment(\.dismiss) var dismissScreen

    var body: some View {
        ZStack {
            Color.pink.opacity(0.5)

            VStack {
                Button(action: {
                    // Deprecated API
                    // presentationMode.wrappedValue.dismiss()

                    // New API
                    dismissScreen()
                }, label: {
                    Text("Close ping full screen")
                        .padding()
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10.0)
                        )
                })
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SheetsAndFullscreenCoverExample()
}
