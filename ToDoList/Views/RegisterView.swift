//
//  RegisterView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI

struct RegisterView: View {
   
    
    @StateObject var registerViewM = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start Orgonizing Todos", angle: -15, backgroud: .orange)
            
            Form{
                TextField("Full Name", text: $registerViewM.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("email", text: $registerViewM.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $registerViewM.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", background: .green){
                    // register
                    registerViewM.regoister()
                }
            }
            .offset(y: -50)
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
