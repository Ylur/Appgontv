//
//  WheeView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 9.5.2024.

import Foundation
import SwiftUI
import AVFoundation
import UIKit

struct WheelView: View {
    let segments = ["Einn", "Tveir", "Þrír", "Fjórir", "Fimm", "Sex"]
    let colors: [Color] = [.green, .orange, .red, .blue, .purple, .yellow]
    
    @State private var angle: Double = 0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var selectedSegment: Int?

    var body: some View {
        ZStack {
            ForEach(0..<segments.count, id: \.self) { index in
                let startAngle = Angle(degrees: Double(index) * 360 / Double(segments.count))
                let endAngle = Angle(degrees: Double(index + 1) * 360 / Double(segments.count))
                
                SegmentView(
                    radius: 150,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    color: colors[index % colors.count],
                    text: segments[index]
                )
                .rotationEffect(.degrees(angle))
            }

            // örin efst
            Triangle()
                .fill(Color.black)
                .frame(width: 20, height: 20)
                .offset(x: 0, y: 170)
                .rotationEffect(.degrees(180))

            Button(action: {
                spinWheel()
                playSound()
            }) {
                Text("Snúa")
                    .padding(20)
                    .background(Circle().fill(Color.blue))
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .accessibility(label: Text("Spin the wheel"))
            .position(x: 150, y: 150)
        }
        .frame(width: 300, height: 300) // ZStack stillingar
    }

    func spinWheel() {
        withAnimation(.easeOut(duration: 2)) {
            let spins = Double.random(in: 2...4)
            let randomAngle = Double.random(in: 0...360)
            angle += spins * 360 + randomAngle

           
            let totalSegments = Double(segments.count)
            let normalizedAngle = angle.truncatingRemainder(dividingBy: 360)
            let segmentAngle = 360 / totalSegments
            selectedSegment = Int((normalizedAngle + segmentAngle / 2) / segmentAngle) % segments.count

            // titringur
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "SpinSound", withExtension: "wav") else {
            print("Could not find sound file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct SegmentView: View {
    let radius: CGFloat
    let startAngle: Angle
    let endAngle: Angle
    let color: Color
    let text: String

    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let midAngle = Angle(degrees: (startAngle.degrees + endAngle.degrees) / 2)
            let textPosition = CGPoint(
                x: center.x + cos(midAngle.radians) * (radius / 1.5),
                y: center.y + sin(midAngle.radians) * (radius / 1.5)
            )
            
            ZStack {
                Path { path in
                    path.move(to: center)
                    path.addArc(center: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: false)
                }
                .fill(color)

                Text(text)
                    .position(textPosition)
                    .rotationEffect(.degrees(-midAngle.degrees))
            }
            .frame(width: geometry.size.width, height: geometry.size.height) 
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
    }
}
