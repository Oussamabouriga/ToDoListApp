//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//
import FirebaseAuth
import Foundation


class LoginViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var erroeMessage = ""
    init(){
        
    }
    func login(){
        guard validate() else {
            return
        }
        // try log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    private func validate() -> Bool{
        
        erroeMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            erroeMessage = "please fill in all fieleds "
            return false
             
        }
        guard email.contains("@") && email.contains(".") else {
            erroeMessage = "please enter valid email "
            return false
        }
        return true
    }
}

