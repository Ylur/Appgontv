//
//  CameraSearch.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation
import SwiftUI
import UIKit
import SwiftSoup

class ViewController: UIViewController {
    // UI stillingar
    let inputTextField = UITextField()
    let searchButton = UIButton(type: .system)
    let resultTextView = UITextView()
    
    
    var cameraTitle: String = "Camera Search" {
        didSet {
            self.navigationItem.title = cameraTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.title = cameraTitle
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        inputTextField.borderStyle = .roundedRect
        inputTextField.placeholder = "Enter camera name (e.g., 'Canon EOS R5')"
        
        // Leitar takkinn
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        // uppfæra þetta fyrir betri UI
        resultTextView.isEditable = false
        
        // Layout
        let stackView = UIStackView(arrangedSubviews: [inputTextField, searchButton, resultTextView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            inputTextField.heightAnchor.constraint(equalToConstant: 50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            resultTextView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func searchButtonTapped() {
        guard let cameraName = inputTextField.text, !cameraName.isEmpty else { return }
        let url = constructURL(cameraName: cameraName)
        self.cameraTitle = cameraName  //uppfærir titil með nafni myndavélar
        fetchProductDetails(url: url)
    }
    
    func constructURL(cameraName: String) -> URL? {
        let parts = cameraName.split(separator: " ")
        guard parts.count >= 2 else { return nil }
        let brand = parts[0].lowercased()
        let model = parts.dropFirst().joined(separator: "").lowercased()
        return URL(string: "https://www.dpreview.com/products/\(brand)/slrs/\(brand)_\(model)/specifications")
    }
    
    func fetchProductDetails(url: URL?) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.resultTextView.text = "Failed to fetch data."
                }
                return
            }
            let htmlContent = String(data: data, encoding: .utf8) ?? ""
            DispatchQueue.main.async {
                let parsedContent = self?.parseHTML(html: htmlContent) ?? ""
                self?.resultTextView.text = self?.formatProductDetails(rawText: parsedContent)
            }
        }.resume()
    }
    
    func parseHTML(html: String) -> String {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            if let table = try doc.select("table.specsTable").first() {
                return try table.text()
            } else {
                return "No detailed specifications found."
            }
        } catch {
            return "Error parsing HTML: \(error.localizedDescription)"
        }
    }

    func formatProductDetails(rawText: String) -> String {
        // targeta yfirflokka hér til að drilla niður á info
        let categories = ["Price", "Body type", "Sensor", "Processor", "Image ISO", "Optics & Focus", "Screen / viewfinder",
            "Photography features", "Videography features", "Storage", "Connectivity", "Physical", "Other features"]
        
        var formattedText = ""
        var lastIndex = rawText.startIndex

        for category in categories {
            if let range = rawText.range(of: category, range: lastIndex..<rawText.endIndex) {
                
                let sectionText = String(rawText[lastIndex..<range.lowerBound]).trimmingCharacters(in: .whitespacesAndNewlines)
                if !sectionText.isEmpty {
                    formattedText += "\(category):\n\(sectionText)\n\n"
                }
                lastIndex = range.lowerBound
            }
        }
        
        
        let finalSection = String(rawText[lastIndex..<rawText.endIndex]).trimmingCharacters(in: .whitespacesAndNewlines)
        if !finalSection.isEmpty {
            formattedText += "\(finalSection)\n"
        }

        return formattedText
    }
}
