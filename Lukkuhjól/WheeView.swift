//
//  WheeView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 9.5.2024.

import Foundation
import SwiftUI
import AVFoundation

struct WheelView: View {
    let segments = ["Einn", "Tveir", "Þrír", "Fjórir", "Fimm", "Sex"]
    @State private var angle: Double = 0
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            ForEach(0..<segments.count, id: \.self) { index in
                let startAngle = Angle(degrees: Double(index) * 360 / Double(segments.count))
                let endAngle = Angle(degrees: Double(index + 1) * 360 / Double(segments.count))
                let midAngle = Angle(degrees: (startAngle.degrees + endAngle.degrees) / 2)
                
                PieSliceView(radius: 150, startAngle: startAngle, endAngle: endAngle, color: index % 2 == 0 ? .orange : .green)
                    .rotationEffect(.degrees(angle))
                    .overlay(
                        GeometryReader { geometry in
                            Text(segments[index])
                                .position(x: geometry.size.width / 2 + CGFloat(cos(midAngle.radians)) * 120,
                                          y: geometry.size.height / 2 + CGFloat(sin(midAngle.radians)) * 120)
                        }
                    )
            }
            
            Button("Snúa") {
                spinWheel()
                playSound()
            }
            .padding(20)
            .background(Circle().fill(Color.blue))
            .foregroundColor(.white)
            .font(.headline)
            .position(x: 150, y: 150) //stilla í miðjuna
        }
        .frame(width: 300, height: 300) // Zstack stillingar
    
    }

    func spinWheel() {
        withAnimation(.easeOut(duration: 2)) { // tími sem hjólið snýst
            let spins = Double.random(in: 2...4) // fjöldi snúninga sem hjólið tekur
            let randomAngle = Double.random(in: 0...360)
            angle += spins * 360 + randomAngle
        }
    }
    func playSound() {
        guard Bundle.main.url(forResource: "SpinSound", withExtension: "wav") != nil else {
            // ef eitthvað klikkar
            print("Could not find sound file.")
            return
        }
    }
}
