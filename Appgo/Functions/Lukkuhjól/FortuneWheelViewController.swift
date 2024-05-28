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
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let startAngle = angle
            let endAngle = angle + .degrees(360 / 6)
            
            Path { path in
                path.move(to: center)
                path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            }
            .fill(Color.green)
            .overlay(
                Text(text)
                    .rotationEffect(.radians(-angle.radians - .pi/6))
                    .position(x: center.x + radius / 2 * cos(CGFloat(angle.radians + .pi/6)),
                              y: center.y + radius / 2 * sin(CGFloat(angle.radians + .pi/6)))
            )
        }
    }
}
