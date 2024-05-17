//
//  UserStorage.swift
//  Appgo
//  Created by Ingi Haraldss on 5.5.2024.
import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserStorage {
    static let shared = UserStorage()
    private let allowedDomains = ["appgo.is", "appgo.com", "nemandi.ntv.is"]
    private let db = Firestore.firestore()
    
    private let emailKey = "userEmail"
    private let passwordKey = "userPassword"
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    func rememberUser(email: String, password: String) {
        userDefaults.set(email, forKey: emailKey)
        userDefaults.set(password, forKey: passwordKey)
    }
    
    func isUserRemembered() -> Bool {
        return userDefaults.string(forKey: emailKey) != nil && userDefaults.string(forKey: passwordKey) != nil
    }
    
    func getRememberedEmail() -> String? {
        return userDefaults.string(forKey: emailKey)
    }
    
    func getRememberedPassword() -> String? {
        return userDefaults.string(forKey: passwordKey)
    }
    
    func forgetUser() {
        userDefaults.removeObject(forKey: emailKey)
        userDefaults.removeObject(forKey: passwordKey)
    }
    
    func isDomainAllowed(email: String) -> Bool {
        guard let domain = email.split(separator: "@").last else {
            return false
        }
        return allowedDomains.contains(String(domain))
    }
    
    func signUp(username: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        guard isDomainAllowed(email: email) else {
            completion(false, "Netfang hafnað")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            guard let user = authResult?.user else {
                completion(false, "Ekki gegkk að stofna aðgang")
                return
            }
            
            let userData: [String: Any] = [
                "username": username,
                "email": email,
                "createdAt": Timestamp()
            ]
            
            self?.db.collection("users").document(user.uid).setData(userData) { error in
                if let error = error {
                    completion(false, error.localizedDescription)
                    return
                }
                completion(true, nil)
            }
        }
    }
    
    func authenticate(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            completion(true, nil)
        }
    }
}
