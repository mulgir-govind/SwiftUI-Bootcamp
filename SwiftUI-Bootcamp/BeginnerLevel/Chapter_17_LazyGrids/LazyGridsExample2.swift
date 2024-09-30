//
//  LazyGridsExample2.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 31/08/24.
//

import SwiftUI

struct LazyGridsExample2: View {
    
    let colums = [
        GridItem(.adaptive(minimum: 80, maximum: 100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, pinnedViews: [.sectionHeaders], content: {
                Section {
                    ForEach(0x1f600...0x1f60e, id: \.self) { value in
                        RoundedRectangle(cornerRadius: 5.0)
                            .fill(Bool.random() ? (Bool.random() ? .pink : .yellow) : (Bool.random() ? .green : .blue))
                            .frame(width: 80, height: 100)
                            .padding(.all, 2)
                            .overlay(
                                VStack {
                                    Text(emoji(value))
                                        .font(.largeTitle)
                                    Text(String(format: "%x", value))
                                }
                            )
                    }
                } header: {
                    Text("Emoji")
                        .font(.title)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background(.purple)
                }

                Section {
                    ForEach(1 ..< 50, id: \.self) { value in
                        Circle()
                            .fill(Bool.random() ? (Bool.random() ? .pink : .yellow) : (Bool.random() ? .green : .blue))
                            .frame(width: 80, height: 80)
                            .padding(.all, 2)
                            .overlay(
                                VStack {
                                    Text("\(value)")
                                        .font(.largeTitle)
                                }
                            )
                    }
                } header: {
                    Text("Numbers")
                        .font(.title)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background(.purple)
                }
            })
        }
        .padding()
    }

    // MARK: - Private function

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    LazyGridsExample2()
}
