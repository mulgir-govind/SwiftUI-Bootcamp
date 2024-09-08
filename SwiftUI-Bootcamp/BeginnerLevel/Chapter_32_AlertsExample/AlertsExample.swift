//
//  AlertsExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 08/09/24.
//

import SwiftUI

struct GroceryItem: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
    
}

struct AlertsExample: View {
    @State private var groceryItemList: [GroceryItem] = []
    @State private var showAddItemAlert: Bool = false
    @State private var newItemName: String = ""
    @State private var newItemQuantity: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.brown.opacity(0.2)
                    .ignoresSafeArea()
                
                if groceryItemList.count == 0 {
                    Text("No item added")
                } else {
                    List {
                        ForEach(groceryItemList) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("\(item.quantity)")
                            }
                        }
                        .onDelete(perform: deleteItem) // Short-hand function
                        .onMove(perform: reorderItem) // Short-hand function
                    }
                    .navigationBarItems(leading: EditButton())
                }
            } // END - ZStack
            .navigationTitle("Grocery List")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing:
                    Button(action: {
                        showAddItemAlert = true
                    }, label: {
                        Image(systemName: "plus")
                            .font(.headline)
                    })
            )
            .alert("Add new item", isPresented: $showAddItemAlert) {
                TextField("Enter item name", text: $newItemName)
                TextField("item quantity in Kg/pieces", text: $newItemQuantity)

                Button("Cancel", role: .cancel) {}
                Button("Add") {
                    addItem(named: newItemName, quantity: newItemQuantity)
                    newItemName = ""
                    newItemQuantity = ""
                }
            } message: {
               // Not needed. Can be deleted
            }
        }
    }

    func delete(indexSet: IndexSet) {
        groceryItemList.remove(atOffsets: indexSet)
    }
    
    func addItem(named name: String, quantity: String) {
        if let quantity = Int(quantity), !name.isEmpty {
            groceryItemList.append(GroceryItem(name: name, quantity: quantity))
        }
    }
    
    func deleteItem(at indexSet: IndexSet) {
        groceryItemList.remove(atOffsets: indexSet)
    }
    
    func reorderItem(from indexSet: IndexSet, with newOffset: Int) {
        groceryItemList.move(fromOffsets: indexSet, toOffset: newOffset)
    }
}

#Preview {
    AlertsExample()
}
