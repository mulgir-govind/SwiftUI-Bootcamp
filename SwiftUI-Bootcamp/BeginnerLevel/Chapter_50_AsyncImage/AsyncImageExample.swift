//
//  AsyncImageExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 17/09/24.
//

import SwiftUI

struct AsyncImageExample: View {
    private let imageURL: URL? = URL(string: "https://picsum.photos/200/300")
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [ GridItem(.adaptive(minimum: 150, maximum: 180))] ,spacing: 20){
                    ForEach(0 ..< 5) { item in
                        AsyncImage(url: imageURL) { returnedImage in
                            returnedImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 160)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    ForEach(0 ..< 50) { item in
                        AsyncImage(url: imageURL) { imagePhase in
                            switch imagePhase {
                                case .empty:
                                    ProgressView()
                                        .tint(.red)
                                case .success(let returnedImage):
                                    returnedImage
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 160)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                case .failure(let error):
                                    Text(error.localizedDescription)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                default:
                                    Image(systemName: "questionmark.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Async images")
        }
    }
}

#Preview {
    AsyncImageExample()
}
