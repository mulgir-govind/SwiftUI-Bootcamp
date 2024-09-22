//
//  ResizableSheetExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import SwiftUI

struct ResizableSheetExample: View {
    @State private var showBottomSheet: Bool = false
    @State private var disableInteractiveDismiss: Bool = false
    @State private var presentationDetent: PresentationDetent = .medium
    var body: some View {
        VStack {
            List {
                Button(action: {
                    showBottomSheet.toggle()
                }, label: {
                    Text("Show button sheet")
                })
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.mini)

                Toggle(isOn: $disableInteractiveDismiss, label: {
                    Text("Interactive sheet dismissal disabled?")
                })
            }
            .padding()
        }
        .sheet(isPresented: $showBottomSheet, content: {
            ResizableBottomSheetView(disableInteractiveDismiss: $disableInteractiveDismiss,
                                     presentationDetent: $presentationDetent)
                .interactiveDismissDisabled(disableInteractiveDismiss)
//                .presentationDragIndicator(.hidden)
                .presentationDetents([.fraction(0.2), .height(200), .medium, .large],
                                     selection: $presentationDetent)
        })
    }
}

struct ResizableBottomSheetView: View {
    @Binding var disableInteractiveDismiss: Bool
    @Binding var presentationDetent: PresentationDetent

    @State var backgroundColor: Color = .teal
    var body: some View {
        ZStack(alignment: .top) {
            backgroundColor.opacity(0.2).ignoresSafeArea()

            VStack(alignment: .center, spacing: 40) {
                Toggle(isOn: $disableInteractiveDismiss, label: {
                    Text("Interactive sheet dismissal disabled?")
                })

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(".fraction(0.2)") {
                            presentationDetent = .fraction(0.2)
                            backgroundColor = .cyan
                        }

                        Button(".height(200)") {
                            presentationDetent = .height(200)
                            backgroundColor = .pink
                        }

                        Button(".medium") {
                            presentationDetent = .medium
                            backgroundColor = .teal
                        }
                        
                        Button(".large") {
                            presentationDetent = .large
                            backgroundColor = .yellow
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.mini)
                .buttonBorderShape(.capsule)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ResizableSheetExample()
}
