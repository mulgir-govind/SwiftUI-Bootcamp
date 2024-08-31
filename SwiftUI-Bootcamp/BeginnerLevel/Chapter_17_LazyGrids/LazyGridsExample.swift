//
//  LazyGridsExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 31/08/24.
//

import SwiftUI

struct LazyGridsExample: View {
    let columns = [
//        GridItem(.fixed(100), spacing: 6, alignment: .center),
//        GridItem(.fixed(100), spacing: 12, alignment: .leading),
//        GridItem(.fixed(100), spacing: 2, alignment: .trailing),

//        GridItem(.flexible(minimum: 100, maximum: 150), alignment: .center),
        GridItem(.adaptive(minimum: 80, maximum: 150), spacing: 0, alignment: .leading),
    ]
    
    let rows = [
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 6, alignment: .center),
    ]

    var body: some View {
        VStack {
            ScrollView() {
                LazyVGrid(columns: columns ,spacing: 10) {
                    ForEach(0x1f600...0x1f64f, id: \.self) { value in
                        Circle()
                            .fill(Bool.random() ? (Bool.random() ? .pink : .yellow) : (Bool.random() ? .green : .blue))
                            .frame(width: 80, height: 80)
                            .padding(.all, 2)
                            .overlay(
                                VStack {
                                    Text(emoji(value))
                                        .font(.largeTitle)
                                }
                            )
                    }
                }
            }
            .padding(.all, 10)
            .background(.clear)
            
            Divider()
                .background(.black)

            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(0x1f600...0x1f64f, id: \.self) { value in
                        RoundedRectangle(cornerRadius: 5.0)
                            .fill(Bool.random() ? (Bool.random() ? .pink : .yellow) : (Bool.random() ? .green : .blue))
                            .frame(width: 100, height: 100)
                            .padding(.all, 2)
                            .overlay(
                                VStack {
                                    Text(String(format: "%x", value))
                                    Text(emoji(value))
                                        .font(.largeTitle)
                                }
                            )
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
    
    // MARK: - Private function

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    LazyGridsExample()
}
