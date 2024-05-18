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
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
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
