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
        HStack {
            Image(systemName: imageName)
                .foregroundColor(color)
            Text(title)
        }
    }
}

