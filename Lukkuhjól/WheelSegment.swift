//
//  WheelSegment.swift
//  Appgo
//
//  Created by Ingi Haraldss on 9.5.2024.
//

import Foundation
import SwiftUI

struct WheelSegment: View {
    
    var radius: CGFloat
    var angle: Angle
    var text: String

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2),
                            radius: radius,
                            startAngle: angle,
                            endAngle: angle + .degrees(360 / 6),
                            clockwise: false)
            }
            .fill(Color.green)
            .overlay(
                Text(text)
                    .rotationEffect(-angle - .degrees(360 / 12)) // Aðlaga textann betur og laga snúning
                    .position(x: geometry.size.width / 2 + radius / 2 * cos(CGFloat(angle.radians + .pi/6)),
                              y: geometry.size.height / 2 + radius / 2 * sin(CGFloat(angle.radians + .pi/6)))
            )
        }
    }
}
