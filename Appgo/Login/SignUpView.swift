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
    @State private var isLoading = false
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("ol")
                .resizable()
                .scaledToFit()
                .padding()
        
            TextField("Netfang", text: $email)
                .padding(8)
                .background(Color.white)  // Bakgrunnur á textasvæði
                .cornerRadius(8)
          // Overlay til að stíla þetta meira
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)  // Litur og breidd á umgjörð
                )
                .padding()
            
            SecureField("Lykilorð", text: $password)
                .padding(8)
                .background(Color.white)  // Bakgrunnur á textasvæði
                .cornerRadius(8)
          // Overlay til að stíla þetta meira
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)  // Litur og breidd á umgjörð
                )
                .padding()
            
            Button(action: {
                authViewModel.signUp(email: email, password: password) { success, error in
                    isLoading = false
                    if success {
                        username = ""
                        email = ""
                        password = ""
                        signUpConfirmationMessage = "Aðgangur stofnaður"
                        errorMessage = nil
                    } else {
                        errorMessage = error
                        signUpConfirmationMessage = nil
                    }
                }
                
            }) {
                Text("Nýskrá")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
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
