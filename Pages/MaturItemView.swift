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
                .resizable()  // stækkanleg
                .scaledToFit()  //halda formi
                .foregroundColor(color)
                .frame(width: 40, height: 40)  // föst stærð
            Text(title)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)  // stækkanlegur texti
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 150, height: 150)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}



