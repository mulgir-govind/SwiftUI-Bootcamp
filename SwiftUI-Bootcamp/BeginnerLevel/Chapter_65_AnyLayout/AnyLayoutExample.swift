//
//  AnyLayoutExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 22/09/24.
//

import SwiftUI

struct AnyLayoutExample: View {
    @State private var outerVerticalArrangement: Bool = false
    @State private var innerVerticalArrangement: Bool = false
    var body: some View {
        NavigationStack {
            let outerLayout = outerVerticalArrangement ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            let innerLayout = innerVerticalArrangement ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            outerLayout {
                innerLayout {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green.opacity(0.8))
                        .frame(width: 50, height: 50)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.pink.opacity(0.8))
                        .frame(width: 50, height: 50)
                }
                .animation(.spring, value: innerVerticalArrangement)

                innerLayout {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow.opacity(0.8))
                        .frame(width: 50, height: 50)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple.opacity(0.8))
                        .frame(width: 50, height: 50)
                }
                .animation(.spring, value: innerVerticalArrangement)
            }
            .animation(.spring, value: outerVerticalArrangement)
            .padding()
            .navigationTitle("AnyLayout example")
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Toggle("Arrange outer view vertically?", isOn: $outerVerticalArrangement)
                Toggle("Arrange inner view vertically?", isOn: $innerVerticalArrangement)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.tertiary)
            )
            .padding()
            
        }
    }
}

#Preview {
    AnyLayoutExample()
}
