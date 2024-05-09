//
//  MaturItemView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI

struct MenuItemView: View {
    var title: String
    var imageName: String
    var color: Color

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()  // Make sure the image can resize
                .scaledToFit()  // Maintain the aspect ratio of the image
                .foregroundColor(color)
                .frame(width: 40, height: 40)  // Set fixed size for images
            Text(title)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)  // Ensure text can grow vertically but not horizontally
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 150, height: 150)  // Set a fixed frame for the entire MenuItemView
        .background(Color.white)  // Use theme-appropriate colors
        .cornerRadius(10)  // Rounded corners for aesthetics
        .shadow(radius: 5)  // Drop shadow for depth
    }
}



