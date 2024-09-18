//
//  BackgroundMaterialExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 18/09/24.
//

import SwiftUI

struct BackgroundMaterialExample: View {
    private let backgroundMaterials: [String: Material] = [
        "thin": .thin,
        "thik": .thick,
        "regular": .regular,
        "thinMaterial": .thinMaterial,
        "ultraThinMaterial": .ultraThinMaterial,
        "thickMaterial": .thickMaterial,
        "ultraThickMaterial": .ultraThickMaterial
    ]
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum: 180))]) {
                    ForEach(Array(backgroundMaterials.keys), id: \.self) { key in
                        Rectangle()
                            .frame(width: 160, height: 160)
                            .background(backgroundMaterials[key]!)
                            .overlay {
                                VStack {
                                    Text(key)
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    BackgroundMaterialExample()
}
