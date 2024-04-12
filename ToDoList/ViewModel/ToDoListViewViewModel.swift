//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import Foundation
import FirebaseFirestore
//ViewModel for list of items
class ToDoListViewViewModel :ObservableObject{
    private let  userId: String
    @Published var  showingNewItemView = false
    init(userId : String){
        self.userId = userId
        
    }
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
