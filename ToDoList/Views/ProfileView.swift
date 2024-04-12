//
//  ProfileView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                content
            }
            .navigationTitle("Profile")
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if let user = viewModel.user {
            userProfile(for: user)
        } else {
            Text("Loading Profile...")
        }
    }

    private func userProfile(for user: User) -> some View {
        VStack {
            userImage
            userDetails(for: user)
            logoutButton
            Spacer()
        }
    }

    private var userImage: some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
    }

    private func userDetails(for user: User) -> some View {
        VStack(alignment: .leading) {
            userDetailRow(label: "Name:", value: user.name)
            userDetailRow(label: "Email:", value: user.email)
            userDetailRow(label: "Member Since:", value: formattedDate(from: user.joind))
        }
        .padding()
    }

    private func userDetailRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .bold()
            Text(value)
        }
    }

    private func formattedDate(from timestamp: TimeInterval) -> String {
        Date(timeIntervalSince1970: timestamp)
            .formatted(date: .abbreviated, time: .shortened)
    }

    private var logoutButton: some View {
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
    }
}

// MARK: - Preview

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

