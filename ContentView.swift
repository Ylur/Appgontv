//
//  ContentView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if authViewModel.isSignedIn {
            MainMenu()
        } else {
            AuthView(isSignedIn: $authViewModel.isSignedIn)
        }
    }
}
