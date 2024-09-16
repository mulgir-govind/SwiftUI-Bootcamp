//
//  TapGestureExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

struct TapGestureExample: View {
    @State private var showDogImage: Bool = false
    @State private var imageScale: Double = 0.5

    private var animalImageName: String {
        return showDogImage ? "dog" : "cat"
    }

    var body: some View {
        VStack {
            Image(animalImageName)
                .resizable()
                .scaleEffect(imageScale)
                .frame(width: 300, height: 400)
                .onTapGesture(count: 2, perform: {
                    withAnimation {
                        imageScale = imageScale >= 3.0 ? 0.5 : (imageScale + 0.5)
                    }
                })
                .onTapGesture(perform: {
                    withAnimation {
                        showDogImage.toggle()
                        imageScale = 0.5
                    }
                })
                .onLongPressGesture {
                    
                }
        }
    }
}

#Preview {
    TapGestureExample()
}
