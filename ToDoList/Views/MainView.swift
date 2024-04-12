//
//  ContentView.swift
//  ToDoList
//
//  Created by Oussama on 21/3/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var  viewModel = MainViewViewModel()
    
    
    var body: some View {
        if viewModel.isSignIn , !viewModel.currentUserId.isEmpty {
            accountView
            
        }else {
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var  accountView: some View{
        TabView{
            ToDoListView(userId : viewModel.currentUserId)
                .tabItem { Label("Home" ,systemImage: "house")
                    
                }
                ProfileView()
                .tabItem { Label("Profile" ,systemImage: "person.circle")
                    
                }
                    
                }
    }
}

#Preview {
    MainView()
}
