//
//  ObservableExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 16/09/24.
//

import SwiftUI

class TodoItem: Identifiable, ObservableObject {
    let id: String = UUID().uuidString
    @Published var message: String = ""
    @Published var isCompleted: Bool = false

    init(message: String, isCompleted: Bool = false) {
        self.message = message
        self.isCompleted = isCompleted
    }
}

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = []
    @Published var isLoading: Bool = false
    
    init() {
        fetchTodoItems()
    }

    func fetchTodoItems() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            let item1 = TodoItem(message: "Book movie tickets")
            let item2 = TodoItem(message: "Pay electricity bill")
            let item3 = TodoItem(message: "Call Mr. ABC")
            self.todoItems.append(contentsOf: [item1, item2, item3])
            self.isLoading = false
        })
    }

    func addItem(with message: String) {
        guard !message.isEmpty else { return }
        isLoading = true
        let newItem = TodoItem(message: message)
        self.todoItems.append(newItem)
        isLoading = false
    }
}

struct ObservableExample: View {
    @StateObject private var todoListViewModel: TodoListViewModel = TodoListViewModel()
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack {
                if todoListViewModel.isLoading {
                    VStack(spacing: 20) {
                        ProgressView()
                            .progressViewStyle(.circular)
                        Text("Loading...")
                    }
                    .tint(colorScheme == .light ? .black : .white)
                } else {
                    List {
                        ForEach(todoListViewModel.todoItems) { item in
                            CustomCheckboxView(isChecked: item.isCompleted, message: item.message)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Todo-list")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing:
                                    NavigationLink { AddTodoItemScreen(todoListViewModel: todoListViewModel) } label: {
                Label("Add item", systemImage: "plus")
                    .font(.title)
                    .foregroundStyle(colorScheme == .light ? .black : .white)
            })
        }
    }
}

struct AddTodoItemScreen: View {
    @Environment(\.dismiss) var dismissAction
    @Environment(\.colorScheme) var colorScheme

    @State private var message: String = ""
    @ObservedObject var todoListViewModel: TodoListViewModel

    var body: some View {
        VStack {
            TextEditor(text: $message)
                .padding(20)
                .textEditorStyle(.plain)
                .foregroundStyle(colorScheme == .light ? .black : .white)
                .font(.title2)
                .frame(height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(colorScheme == .light ? .black : .white,
                            lineWidth: 2.0)
                )
                .padding()
                .navigationTitle("Add new item")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarBackButtonHidden(true)

            HStack {
                Button(action: {
                    dismissAction()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(colorScheme == .light ? .white : .black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colorScheme == .light ? .black.opacity(0.5) : .white.opacity(0.5))
                        )
                })

                Button(action: {
                    todoListViewModel.addItem(with: message)
                    dismissAction()
                }, label: {
                    Text("Add")
                        .foregroundStyle(colorScheme == .light ? .white : .black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colorScheme == .light ? .black : .white)
                        )
                })
            }

            Spacer()
        }
    }
}

struct CustomCheckboxView: View {
    @State var isChecked: Bool
    @State var message: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(isChecked ? .green : .primary.opacity(0.7))
                .onTapGesture {
                    withAnimation {
                        isChecked.toggle()
                    }
                }

            if isChecked {
                Text(message)
                    .strikethrough()
                    .font(.subheadline)
                    .opacity(0.8)
            } else {
                Text(message)
                    .font(.body)
            }
        }
    }
}

#Preview {
    ObservableExample()
}
