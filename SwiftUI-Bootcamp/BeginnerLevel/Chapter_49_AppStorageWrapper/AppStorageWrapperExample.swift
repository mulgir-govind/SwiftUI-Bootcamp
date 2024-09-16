//
//  AppStorageWrapperExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

struct AppStorageWrapperExample: View {
    // @AppStorage property auto store/read value from User-defaults
    @AppStorage("articleDraftKey") private var articleDraft: String = ""
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack(spacing:0) {
                    TextEditor(text: $articleDraft)
                        .textEditorStyle(.plain)
                        .padding()
                        .frame(
                            width: proxy.frame(in: .local).width * 0.9,
                            height: proxy.frame(in: .local).height * 0.8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 2.0)
                        )
                        .padding()
                        .coordinateSpace(name: "textEditorCoordSpace")

                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "arrow.counterclockwise.icloud")
                            Text("Auto-save enabled")
                        }
                        .foregroundStyle(.green)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Essay")
        }
    }
}

#Preview {
    AppStorageWrapperExample()
}
