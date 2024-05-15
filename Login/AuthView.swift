//
//  AuthView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.

import Foundation
import Combine
import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Image("ol")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    TextField("Notendanafn", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                    
                    SecureField("Lykilorð", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                    
                    Button("Innskráning") {
                        viewModel.signIn(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                    
                    Button("Nýskráning") {
                        isActive = true
                    }
                    .padding()

                    if let errorMessage = viewModel.signInErrorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                
                Spacer()
            }
            .navigationDestination(isPresented: $isActive) {
                SignUpView()
                    .environmentObject(viewModel)
            }
        }
    }
}
