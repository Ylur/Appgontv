//
//  SearchView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import SwiftUI
import SwiftSoup

struct Phone: Identifiable {
    let id = UUID()
    let name: String
    let brand: String
    let price: Double
}

class SearchViewModel: ObservableObject {
    @Published var searchResults: [Phone] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    func search(query: String) {
        isLoading = true
        
        guard let url = URL(string: "https://www.gsmarena.com/results.php3?nYearMin=2020&nPriceMax=\(query)&sAvailabilities=1") else {
            isLoading = false
            error = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    self.error = error
                }
                return
            }
            
            guard let data = data, let htmlString = String(data: data, encoding: .utf8) else {
                DispatchQueue.main.async {
                    self.error = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Failed to parse data"])
                }
                return
            }
            
            do {
                let doc = try SwiftSoup.parse(htmlString)
                let phones = try doc.select(".makers").select("li")
                
                var results: [Phone] = []
                
                for phone in phones {
                    let name = try phone.select(".makers")[0].text()
                    let brand = try phone.select(".makers")[1].text()
                    let price = try phone.select(".price").text()
                    let phone = Phone(name: name, brand: brand, price: Double(price) ?? 0.0)
                    results.append(phone)
                }
                
                DispatchQueue.main.async {
                    self.searchResults = results
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }.resume()
    }
}

struct SearchPage: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
               
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                } else {
                    List(viewModel.searchResults) { phone in
                        NavigationLink(destination: ProductDetailView(phone: phone)) {
                            VStack(alignment: .leading) {
                                Text(phone.name)
                                Text(phone.brand)
                                    .font(.caption)
                                Text("\(phone.price)")
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search Results")
        }
    }
}
