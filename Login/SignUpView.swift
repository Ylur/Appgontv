//
//  SignUpView.swift
//  Appgo
//  Created by Ingi Haraldss on 12.5.2024.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var signUpConfirmationMessage: String?
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Nýskráning")
                .font(.largeTitle)
            //sameina við email seinna
            TextField("Notendanafn", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Netfang", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Lykilorð", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                authViewModel.signUp(username: username, email: email, password: password) { success, error in
                    if success {
                        signUpConfirmationMessage = "Aðgangur stofnaður"
                        errorMessage = nil
                    } else {
                        errorMessage = error
                        signUpConfirmationMessage = nil
                    }
                }
            }) {
                Text("Nýskráning")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            if let signUpConfirmationMessage = signUpConfirmationMessage {
                Text(signUpConfirmationMessage)
                    .foregroundColor(.green)
                    .padding(.top)
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top)
            }
        }
        .padding()
    }
}
