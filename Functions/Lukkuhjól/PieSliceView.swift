//
//  PieSliceView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 9.5.2024.
//

import SwiftUI

struct PieSliceView: View {
    var radius: CGFloat
    var startAngle: Angle
    var endAngle: Angle
    var color: Color

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                path.move(to: center)
                path.addArc(center: center, radius: radius,
                            startAngle: startAngle, endAngle: endAngle, clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
        .aspectRatio(1, contentMode: .fit) // ath betur
    }
}

