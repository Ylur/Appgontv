//
//  GsmSearch.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation
import SwiftSoup

func fetchProductDetails(completion: @escaping (Result<[String: [String: String]], Error>) -> Void) {
    let url = URL(string: "https://www.gsmarena.com/lenovo_tab_p12-12443.php")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200,
              let data = data,
              let htmlString = String(data: data, encoding: .utf8) else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Failed to load product specs"])))
            return
        }
        
        do {
            let document = try SwiftSoup.parse(htmlString)
            let tableRows = try document.select("tr")
            var specs: [String: [String: String]] = [:]
            var currentCategory = ""
            
            for row in tableRows {
                guard let categoryHeader = try row.select("th[scope='row']").first() else { continue }
                currentCategory = try categoryHeader.text().trimmingCharacters(in: .whitespacesAndNewlines)
                specs[currentCategory] = [:]
                
                guard let titleCell = try row.select("td.ttl").first(),
                      let infoCell = try row.select("td.nfo").first() else { continue }
                
                let title = try titleCell.text().trimmingCharacters(in: .whitespacesAndNewlines)
                let value = try infoCell.text().trimmingCharacters(in: .whitespacesAndNewlines)
                specs[currentCategory]?[title] = value
            }
            
            completion(.success(specs))
        } catch {
            completion(.failure(error))
        }
    }
    task.resume()
}

func main() {
    fetchProductDetails { result in
        switch result {
        case .success(let specs):
            print(specs)
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}



