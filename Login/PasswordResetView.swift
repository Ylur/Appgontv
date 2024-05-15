//
//  PasswordResetView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 13.5.2024.
//

import Foundation
import SwiftUI

struct PasswordResetView: View {
    @State private var email: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Netfang", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Endursetja lykilorð") {
                // stuff hér
            }
            .padding()
        }
    }
}
