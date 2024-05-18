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
                Image("ol")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                TextField("Netfang", text: $authViewModel.email)
                      .padding(8)
                      .background(Color.white)  // Bakgrunnur á text
                      .cornerRadius(8)
                // Overlay til að stíla þetta meira
                      .overlay(
                          RoundedRectangle(cornerRadius: 8)
                              .stroke(Color.white, lineWidth: 1)  // Litur og breidd á umgjörð
                      )
                      .padding()
                
                
                SecureField("Lykilorð", text: $authViewModel.password)
                    .padding(8)
                      .background(Color.white)  // Bakgrunnur á textasvæði
                      .cornerRadius(8)
                // Overlay til að stíla þetta meira
                      .overlay(
                          RoundedRectangle(cornerRadius: 8)
                              .stroke(Color.white, lineWidth: 1)  // Litur og breidd á umgjörð
                      )
                      .padding()
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    authViewModel.signIn()
                }) {
                    //textin á takkanum
                    Text("Innskráning")
                        .foregroundStyle(Color.white)
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
            } //texti efst á síðunni
           // .toolbar {
             //   ToolbarItem(placement: .navigationBarLeading) {
               //     Text("Innskráning")
                 //       .font(.headline)
                //}
            //}
        }
    }
}
