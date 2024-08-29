//
//  PaddingExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 29/08/24.
//

import SwiftUI

struct PaddingExample: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Text without padding & frame")
                .background(.blue)
            
            Text("Text with fixed frame")
                .frame(width: 200, height: 50)
                .background(.red)
            
            Text("Text with padding")
                .padding()
                .background(.green)
            
            Text("Text with multiple padding")
                .background(.red)
                .padding()
                .background(.blue)
                .padding(.all, 20)
                .background(.yellow)
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white)
                .frame(width: 350, height: 200)
                .overlay(alignment: .center, content: {
                    HStack(spacing: 20) {
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 100)
                            .overlay(alignment: .top) {
                                VStack(spacing: 20) {
                                    Image(systemName: "heart.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.pink)
                                    .padding([.top], 20)

                                    Text("ABC Company")
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.white)
                                        .fontWeight(.bold)
                                        .padding(.top, 10)
                                }
                            }
                        
                        Rectangle()
                            .fill(.clear)
                            .overlay(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Rx")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .padding(.top, 10)
                                    Text("XYA Tablets")
                                        .font(.title)
                                    Text("contents")
                                        .font(.title2)

                                    HStack(spacing: 5.0) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.brown)
                                            .frame(width: 80, height: 30)
                                            .overlay(
                                                Text("2 mg")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .fill(.purple)
                                            .frame(height: 30)
                                            .overlay(
                                                Text("10 tablets")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                            )
                                    }
                                    .padding(.leading, -10)
                                    .padding([.trailing], 20)
                                    
                                }
                            }
                        
                    }
                })
                .shadow(radius: 10)
        }
        
    }
}

#Preview {
    PaddingExample()
}
