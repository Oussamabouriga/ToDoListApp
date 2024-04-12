//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem

    var body: some View {
        HStack {
            itemDetails
            Spacer()
            completionButton
        }
    }

    private var itemDetails: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.body)

            Text(formattedDueDate)
                .font(.footnote)
                .foregroundStyle(Color(.secondaryLabel))
        }
    }

    private var formattedDueDate: String {
        Date(timeIntervalSince1970: item.dueDate)
            .formatted(date: .abbreviated, time: .shortened)
    }

    private var completionButton: some View {
        Button(action: {
            viewModel.toggleIsDone(item: item)
        }) {
            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundColor(.blue)
        }
    }
}

// MARK: - Preview

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Eat pizza", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
