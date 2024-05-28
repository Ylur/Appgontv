//
//  ContentView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.

import SwiftUI
// muna laga fyrir darkmode
struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showGif = true
    
    var body: some View {
        ZStack {
            Group {
                if showGif {
                    GifImage("origo")
                        .frame(width: 300, height: 100)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                        .background(Color.litir)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            // hversu langur tími frá því að GIF kemur upp og main menu er sýnt
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showGif = false
                                }
                            }
                        }
                    
                } else {
                    if authViewModel.isSignedIn {
                        // ef þú ert innskráður ferðu á aðalsíðuna
                        MainMenu()
                        // ef þú ert ekki skráður inn ferðu hingað
                    }else{
                        AuthView()
                    }
                }
            }
        }
    }
}
