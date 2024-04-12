//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]

    init(userId: String) {
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }

    var body: some View {
        NavigationView {
            toDoList
            .navigationTitle("To Do List")
            .toolbar { addButton }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }

    private var toDoList: some View {
        VStack {
            List(items, id: \.id) { item in
                ToDoListItemView(item: item)
                    .swipeActions {
                        deleteAction(for: item)
                    }
            }
            .listStyle(PlainListStyle())
        }
    }

    private var addButton: some View {
        Button(action: {
            viewModel.showingNewItemView = true
        }) {
            Image(systemName: "plus")
        }
    }

    @ViewBuilder
    private func deleteAction(for item: ToDoListItem) -> some View {
        Button("Delete") {
            viewModel.delete(id: item.id)
        }
        .tint(.red)
    }
}

// MARK: - Preview

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "TBXQxmO5QnhwgQ9dXomuRWl8PJ93")
    }
}
