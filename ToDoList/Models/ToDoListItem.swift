//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import Foundation
struct ToDoListItem : Codable ,Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state : Bool){
        isDone = state 
    }
    
    
}