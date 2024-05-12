//
//  SignUpView.swift
//  Appgo

//  Created by Ingi Haraldss on 12.5.2024.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    // Mun sameina username og email seinna
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Spacer()
            Image("ol")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            TextField("Notendanafn", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            SecureField("Lykilorð", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            Button("Nýskrá") {
                viewModel.signUp(username: username, email: email, password: password)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .padding(.horizontal, 50)
            
            Spacer()
        }
    }
}
