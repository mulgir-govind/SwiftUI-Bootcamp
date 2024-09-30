//
//  ObservableMacroExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 27/09/24.
//

import SwiftUI

@Observable class FruitsModel {
    var fruits: [String] = []

    func addFruit(_ name: String) {
        fruits.append(name)
    }
}

struct ObservableMacroExample: View {
    @State var fruitsModel: FruitsModel = FruitsModel()

    var body: some View {
        NavigationStack {
            ZStack {
                if fruitsModel.fruits.isEmpty {
                    EmptyCartView()
                        .environment(fruitsModel)
                } else {
                    List {
                        ForEach(0 ..< fruitsModel.fruits.count, id: \.self) { index in
                            Text(fruitsModel.fruits[index])
                        }
                        AddItemButtonView(fruitsModel: fruitsModel)
                    }
                }
            }
            .navigationTitle("@Observable macro")
        }
    }
}

struct AddItemButtonView: View {
    var fruitsModel: FruitsModel
    var body: some View {
        Button(action: {
            fruitsModel.addFruit(["Apple", "Banana", "Mango", "Pineapple", "Pear", "Strawberry"].randomElement()!)
        }, label: {
            Label("Add fruit item", systemImage: "plus")
        })
        .padding()
        .buttonBorderShape(.capsule)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(.green)
        .foregroundStyle(.white)
    }
}

struct EmptyCartView: View {
    @Environment(FruitsModel.self) var fruitsModel: FruitsModel
    var body: some View {
        ContentUnavailableView(label: {
            Label("No fruit item", systemImage: "cart")
        }, actions:  {
            AddItemButtonView(fruitsModel: fruitsModel)
        })
    }
}

#Preview {
    ObservableMacroExample()
}
