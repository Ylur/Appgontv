//
//  AuthViewModel.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var errorMessage: String?

    private let storage = UserStorage.shared

    func signIn(username: String, password: String) {
        if storage.authenticate(username: username, password: password) {
            isSignedIn = true
            // Ef slegið er inn rangt auðkenni
        } else {
            isSignedIn = false
            errorMessage = "Rangt lykilorð eða Notendanafn."
        }
    }

    func signUp(username: String, password: String) {
        // Ef notanda nafn er þegar til
        if storage.userExists(username: username) {
            errorMessage = "Notandi er þegar til."
        } else {
            storage.addUser(username: username, password: password)
            isSignedIn = true
        }
    }
}
