//
//  NewItemView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack{
                Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top , 100)
            
            Form{
                //Title
                TextField("Title", text : $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                
                TLButton(title: "Save", background: .pink){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),message:  Text("please fill in all fields and select due that is today or newer."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true }
                                          , set:{ _ in
                                          
                                          }))
}

