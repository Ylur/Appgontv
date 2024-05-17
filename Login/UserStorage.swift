//
//  UserStorage.swift
//  Appgo
//  Created by Ingi Haraldss on 5.5.2024.

import Foundation
import CryptoKit


class UserStorage {
    static let shared = UserStorage()
    // Eingöngu notað í dev
    private let filePath = URL(fileURLWithPath: "/Users/ingih/Applications/Appgo/Appgo/Appgo/users.json")
    
    private let allowedDomains = ["appgo.is", "appgo.com"]
    private var users: [String: String] = [:]
    private var salts: [String: String] = [:]
    private var emails: [String: String] = [:]
                
    init() {
        loadUsers()
    }
    
    func signUp(username: String, password: String, email: String) -> Bool {
        if userExists(username: username) {
            print("Signup failed: Username already exists.")
            return false
        }
        addUser(username: username, email: email, password: password)
        return true
    }

    func isDomainAllowed(email: String) -> Bool {
        guard let domain = email.split(separator: "@").last else {
            return false
        }
        return allowedDomains.contains(String(domain))
    }

    func addUser(username: String, email: String, password: String) {
        let salt = UUID().uuidString
        let hash = hashPassword(password, with: salt)
        users[username] = hash
        salts[username] = salt
        emails[username] = email
        saveUsers()
        // fyrir debug
        print("Added user: \(username)")
    }


    func authenticate(username: String, password: String) -> Bool {
        guard let storedHash = users[username], let salt = salts[username] else { return false }
        return storedHash == hashPassword(password, with: salt)
    }

    func userExists(username: String) -> Bool {
        return users[username] != nil
    }

    private func hashPassword(_ password: String, with salt: String) -> String {
        let saltedPassword = password + salt
        let inputData = Data(saltedPassword.utf8)
        let hashedData = SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }

    private func saveUsers() {
        //uppsett með dev í huga
        let data = ["users": users, "salts": salts, "emails": emails]
        do {
            let jsonData = try JSONEncoder().encode(data)
            try jsonData.write(to: filePath)
            print("Successfully saved user data at \(filePath.path)")
        } catch {
            print("Error saving user data: \(error.localizedDescription)")
        }
    }


    private func loadUsers() {
        if FileManager.default.fileExists(atPath: filePath.path) {
            do {
                let data = try Data(contentsOf: filePath)
                let loadedData = try JSONDecoder().decode([String: [String: String]].self, from: data)
                users = loadedData["users"] ?? [:]
                salts = loadedData["salts"] ?? [:]
            } catch {
                print("Failed to load user data: \(error)")
            }
        } else {
            print("No existing user data file found. A new file will be created upon adding a user.")
            users = [:]
            salts = [:]
        }
    }
}

