//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Oussama on 21/3/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
