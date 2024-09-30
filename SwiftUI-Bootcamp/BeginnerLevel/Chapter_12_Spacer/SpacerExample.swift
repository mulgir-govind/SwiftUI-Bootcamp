//
//  SpacerExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 30/08/24.
//

import SwiftUI

struct SpacerExample: View {
    var body: some View {
        VStack {
            // Add frame over spacer to visually see how
            // much space Spacer is taking.
            Spacer()
                .frame(width: 5)
                .background(.orange)

            // custom spacing between elements
            VStack(spacing: 20) {
                // 1st row
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("1")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("2")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("3")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()

                }
                
                // 2nd row
                HStack {
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("4")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("5")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("6")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                    
                }
                
                // 3rd row
                HStack {
                    Spacer()
                        .frame(height: 5)
                        .background(.orange)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("7")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                        .frame(height: 5)
                        .background(.orange)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("9")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                        .frame(height: 5)
                        .background(.orange)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("9")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    Spacer()
                        .frame(height: 5)
                        .background(.orange)
                    
                }

                // 4th row
                HStack {
                    Spacer()

                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("*")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )

                    Spacer()

                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("0")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("#")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        )
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SpacerExample()
}
