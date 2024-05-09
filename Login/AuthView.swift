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
                    
                    TextField("Nafn", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                    
                    SecureField("Lykilorð", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                    
                    Button("Skrá inn") {
                        // Authentication logic hér
                        self.isSignedIn = true
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                    
                    
                    Button("Ef þú ert ekki með aðgang er nýskráning hér") {
                        
                        self.isActive = true
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationDestination(isPresented: $isActive) {
                SignUpView(isSignedIn: $isSignedIn)
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
                    
                    TextField("Nafn", text: $newUsername)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                    
                    SecureField("Lykilorð", text: $newPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                    
                    Button("Nýskráning") {
                        
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
}
