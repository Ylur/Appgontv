//
//  AuthView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI

struct AuthView: View {
    @Binding var isSignedIn: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showSignUp: Bool = false
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack(spacing: 20) {
                    Image("ol")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)

                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)

                    Button("Sign In") {
                        // Authentication logic hér
                        self.isSignedIn = true
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)

                    // vísun í Sign up
                    NavigationLink(
                        destination: SignUpView(isSignedIn: $isSignedIn),
                        isActive: $isActive,
                        label: {
                            EmptyView()
                        }
                    )

                    Button("Don't have an account? Sign Up") {
                    
                        self.isActive = true
                    }
                    .padding()
                }

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct SignUpView: View {
    @Binding var isSignedIn: Bool
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 20) {
                Image("ol")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)

                TextField("New Username", text: $newUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)

                SecureField("New Password", text: $newPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)

                Button("Sign Up") {
                 
                    self.isSignedIn = true
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal, 50)
            }

            Spacer()
        }
    }
}
