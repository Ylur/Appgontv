//
//  AuthView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.

import Foundation
import Combine
import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Netfang", text: $authViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Lykilorð", text: $authViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    authViewModel.signIn()
                }) {
                    Text("Innskráning")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: PasswordResetView().environmentObject(authViewModel)) {
                    Text("Endursetja lykilorð ?")
                }
                .padding()
                
                NavigationLink(destination: SignUpView().environmentObject(authViewModel)) {
                    Text("Nýskráning")
                }
                .padding()
            }
            .navigationBarTitle("Innskráning")
        }
    }
}
