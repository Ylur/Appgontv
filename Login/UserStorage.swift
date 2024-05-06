//
//  UserStorage.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import Foundation
import CryptoKit

class UserStorage {
    static let shared = UserStorage()
    private var users: [String: String] = [:]
    private var salts: [String: String] = [:]

    func addUser(username: String, password: String) {
        let salt = UUID().uuidString
        let hash = hashPassword(password, with: salt)
        users[username] = hash
        salts[username] = salt
    }

    func authenticate(username: String, password: String) -> Bool {
        guard let storedHash = users[username], let salt = salts[username] else { return false }
        return storedHash == hashPassword(password, with: salt)
    }

    private func hashPassword(_ password: String, with salt: String) -> String {
        let saltedPassword = password + salt
        let inputData = Data(saltedPassword.utf8)
        let hashedData = SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}
