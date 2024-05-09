//
//  UIViewControllerRepresentable.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation
import SwiftUI
import SwiftSoup

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        ViewController() 
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
       
    }
}
