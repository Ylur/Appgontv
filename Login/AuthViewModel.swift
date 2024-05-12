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
    @Published var errorMessage: String?

    private let storage = UserStorage.shared

    func signIn(username: String, password: String) {
        if storage.authenticate(username: username, password: password) {
            isSignedIn = true
        } else {
            isSignedIn = false
            errorMessage = "Rangt lykilorð eða Notendanafn."
        }
    }

    func signUp(username: String, email: String, password: String) {
        if storage.userExists(username: username) {
            errorMessage = "Notandi er þegar til."
        } else if !storage.isDomainAllowed(email: email) {
            errorMessage = "Rangt netfang."
        } else {
            storage.addUser(username: username,email: email, password: password)
            isSignedIn = true
        }
    }
}



