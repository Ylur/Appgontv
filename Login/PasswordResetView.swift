//
//  PasswordResetView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 13.5.2024.
//
import Foundation
import SwiftUI

struct PasswordResetView: View {
    @State private var email: String = ""
    @State private var errorMessage: String?
    @State private var resetConfirmationMessage: String?
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Endursetja lykilorð")
                .font(.largeTitle)
            
            TextField("Netfang", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                authViewModel.resetPassword(for: email) { success, error in
                    if success {
                        resetConfirmationMessage = "Upplýsingar um endursetningu hafa verið sendar"
                        errorMessage = nil
                    } else {
                        errorMessage = error
                        resetConfirmationMessage = nil
                    }
                }
            }) {
                Text("Endursetja lykilorð")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            if let resetConfirmationMessage = resetConfirmationMessage {
                Text(resetConfirmationMessage)
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
