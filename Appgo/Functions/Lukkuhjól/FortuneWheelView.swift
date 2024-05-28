//
//  WheeView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 9.5.2024.
import SwiftUI

struct FortuneWheelView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FortuneWheelViewController {
        return FortuneWheelViewController()
    }

    func updateUIViewController(_ uiViewController: FortuneWheelViewController, context: Context) {}
}
