//
//  FortuneWheel.swift
//  Appgo
//
//  Created by Ingi Haraldss on 19.5.2024.
import UIKit
import AVFoundation

class FortuneWheelViewController: UIViewController {
    
    let wheelContainerView = UIView()
    let wheelImageView = UIImageView()
    let spinButton = UIButton(type: .system)
    let segments = ["V1 1", "V2", "V3", "V4", "V5", "V6"]
    
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupWheel()
        setupSpinButton()
        setupAudioPlayer()
    }
    
    func setupWheel() {
        wheelContainerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        wheelContainerView.center = view.center
        view.addSubview(wheelContainerView)
        wheelImageView.frame = wheelContainerView.bounds
        wheelImageView.image = drawWheel()
        wheelContainerView.addSubview(wheelImageView)
    }
    
    func setupSpinButton() {
        spinButton.setTitle("Snúa", for: .normal)
        spinButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        spinButton.center = CGPoint(x: view.center.x, y: view.center.y + 200)
        spinButton.addTarget(self, action: #selector(spinWheel), for: .touchUpInside)
        view.addSubview(spinButton)
    }
    
    func setupAudioPlayer() {
        guard let url = Bundle.main.url(forResource: "SpinSound", withExtension: "wav") else {
            print("Could not find sound file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }
    
    @objc func spinWheel() {
        let randomAngle = CGFloat(arc4random_uniform(360))
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2 * 3 + Double(randomAngle) * Double.pi / 180
        rotation.duration = 3
        rotation.fillMode = .forwards
        rotation.isRemovedOnCompletion = false
        wheelImageView.layer.add(rotation, forKey: "rotationAnimation")
        
        // Láta birtast skilaboð um verðlaun
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let winningSegmentIndex = Int(randomAngle / 60)
            let winningSegment = self.segments[winningSegmentIndex]
            let alert = UIAlertController(title: "Til lukku!", message: "Þú vannst \(winningSegment)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Takk!", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func drawWheel() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 300))
        return renderer.image { context in
            let ctx = context.cgContext
            let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
            ctx.setFillColor(UIColor.white.cgColor)
            ctx.fill(rect)
            
            let numberOfSegments = segments.count
            let anglePerSegment = CGFloat(Double.pi * 2) / CGFloat(numberOfSegments)
            
            for i in 0..<numberOfSegments {
                ctx.setFillColor(UIColor(hue: CGFloat(i) / CGFloat(numberOfSegments), saturation: 1, brightness: 1, alpha: 1).cgColor)
                ctx.move(to: CGPoint(x: rect.midX, y: rect.midY))
                ctx.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: anglePerSegment * CGFloat(i), endAngle: anglePerSegment * CGFloat(i + 1), clockwise: false)
                ctx.closePath()
                ctx.fillPath()
                
                let segmentLabel = segments[i]
                let midAngle = anglePerSegment * (CGFloat(i) + 0.5)
                let labelX = rect.midX + cos(midAngle) * rect.width / 3
                let labelY = rect.midY + sin(midAngle) * rect.height / 3
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                let attrs: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 14),
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.black
                ]
                
                segmentLabel.draw(with: CGRect(x: labelX - 25, y: labelY - 10, width: 50, height: 20), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
            }
         
            }
        }
    }
