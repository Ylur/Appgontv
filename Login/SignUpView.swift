//
//  SignUpView.swift
//  Appgo

//  Created by Ingi Haraldss on 12.5.2024.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Spacer()
            Image("ol")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            TextField("Netfang", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
                .autocapitalization(.none)  // ath seinna
                .keyboardType(.emailAddress)  //lyklaborðið

            SecureField("Lykilorð", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)

            Button("Nýskráning") {
                viewModel.signUp(username: email, email: email, password: password)  // username er núna email
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .padding(.horizontal, 50)

            Spacer()
        }
    }
}
