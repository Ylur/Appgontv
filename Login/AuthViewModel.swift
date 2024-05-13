//
//  AuthViewModel.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.

import Foundation
import Combine
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var signInErrorMessage: String?
    @Published var signUpErrorMessage: String?


    private let storage = UserStorage.shared

    func signIn(username: String, password: String) {
        if storage.authenticate(username: username, password: password) {
            isSignedIn = true
        } else {
            isSignedIn = false
            signInErrorMessage = "Rangt lykilorð eða Notendanafn."
        }
    }
    func signUp(username: String, email: String, password: String) {
        signUpErrorMessage = nil
        if storage.userExists(username: username) {
            signUpErrorMessage = "Notandi er þegar til."
            return
        }
        else if !storage.isDomainAllowed(email: email) {
            signUpErrorMessage = "Rangt netfang."
            return
        }
        storage.addUser(username: username, email: email, password: password)
           isSignedIn = true  // Ekkert aukaskref ennþá, loggast inn strax
        }
    func PasswordReset(email: String) {
        
        }
    }


