//
//  RicohSearcher.swift
//  Appgo
//
//  Created by Ingi Haraldss on 7.5.2024.
//
import Foundation
import SwiftUI
import UIKit
import SwiftSoup

class RicohSearcher: UIViewController {
    // UI 
    let inputTextField = UITextField()
    let searchButton = UIButton(type: .system)
    let resultTextView = UITextView()
    var activityIndicator = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.title = "Printer/Toner Compatibility Search"
    }

    func setupUI() {
        view.backgroundColor = .white
        inputTextField.borderStyle = .roundedRect
        inputTextField.placeholder = "Enter Printer model or Toner name/number"
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        resultTextView.isEditable = false

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)

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
            resultTextView.heightAnchor.constraint(equalToConstant: 300),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func searchButtonTapped() {
        activityIndicator.startAnimating()
        guard let inputText = inputTextField.text, !inputText.isEmpty else {
            resultTextView.text = "Please enter a product model or toner name/number."
            activityIndicator.stopAnimating()
            return
        }
        let url = constructURL(inputText: inputText)
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
            }
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.resultTextView.text = "Failed to fetch data."
                }
                return
            }
            let htmlContent = String(data: data, encoding: .utf8) ?? ""
            DispatchQueue.main.async {
                let parsedContent = self?.parseSuppliesAndAccessories(html: htmlContent) ?? ""
                self?.resultTextView.text = parsedContent.isEmpty ? "No results found for \(inputText)." : parsedContent
            }
        }.resume()
    }

    func constructURL(inputText: String) -> URL {
        let formattedInput = inputText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        return URL(string: "https://www.ricoh-usa.com/en/search/\(formattedInput)")!
    }

    func parseSuppliesAndAccessories(html: String) -> String {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            // fyrir Debugging
            let containers = try doc.select("div.max-w-[912px].mx-auto.container")
            if containers.isEmpty {
                return "Debug: No containers found."
            }

            var result = "Supplies & Accessories:\n"
            
            for container in containers {
                // enn meira debugging
                let elements = try container.select("div.block.p-4.pb-6.rounded-[10px].text-black-soft.shadow-md.bg-white.print\\:shadow-none.cursor-pointer.mt-8")
                if elements.isEmpty {
                    return "Debug: No elements found within containers."
                }

                for element in elements {
                    let innerDivs = try element.select("div.w-full")
                    if innerDivs.isEmpty {
                        return "Debug: No inner divs found."
                    }

                    for div in innerDivs {
                        let title = try div.select("h4.pb-4.text-lg.leading-6.lg\\:text-2xl").text()  // Debugging: Check if titles are found
                        if title.isEmpty {
                            return "Debug: No title found."
                        }

                        let id = try div.select("p.text-sm.text-grey-primary.pb-4").text()  // sækir ID
                        let listItems = try div.select("ul li").map { try $0.text() }  // sækir öll atriði innan UL

                        let yield = listItems.first { $0.lowercased().contains("yield") } ?? "Yield information not available"
                        let contents = listItems.first { $0.lowercased().contains("contents") } ?? "Contents information not available"

                        result += "\(title)\n\(id)\nYield: \(yield)\nContents: \(contents)\n\n"
                    }
                }
            }
            return result.isEmpty ? "No Supplies & Accessories found." : result
        } catch Exception.Error(let type, let message) {
            return "Parsing error: \(type) \(message)"
        } catch {
            return "An error occurred while parsing."
        }
    }

}

