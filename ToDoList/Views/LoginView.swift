//
//  LoginView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        
        NavigationView{
            
            
            //header
            VStack{
                HeaderView(title: "To Do List", subtitle: "Get Thingd Done", angle: 15, backgroud: .pink)
                
                //login form
               
                Form{
                    if !viewModel.erroeMessage.isEmpty{
                        Text(viewModel.erroeMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("email address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("passwrod", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "login", background: .blue){
                        
                        viewModel.login()
                        // login
                    }
                }
               
                


                
                //create account
                VStack{
                    Text("create an account")
                    NavigationLink("create an account" ,destination: RegisterView())
                    .padding(.bottom,50)
                    
                }
                    
                    Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
