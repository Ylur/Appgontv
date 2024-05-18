//
//  AuthViewModel.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
import Foundation
import Combine
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()

    init() {
        if UserStorage.shared.isUserRemembered() {
            if let email = UserStorage.shared.getRememberedEmail(),
               let password = UserStorage.shared.getRememberedPassword() {
                self.email = email
                self.password = password
                self.signIn()
            }
        }
    }
    
    func signIn() {
        UserStorage.shared.authenticate(email: email, password: password) { [weak self] success, error in
            if let error = error {
                self?.errorMessage = error
                return
            }
            self?.isSignedIn = success
            if success {
                UserStorage.shared.rememberUser(email: self?.email ?? "", password: self?.password ?? "")
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isSignedIn = false
            UserStorage.shared.forgetUser()
        } catch let signOutError as NSError {
            print("Villa við útskráningu: %@", signOutError)
        }
    }
    
    func resetPassword(for email: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            completion(true, nil)
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        UserStorage.shared.signUp(email: email, password: password) { success, error in
            if let error = error {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }
}
