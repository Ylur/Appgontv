//
//  ProductDetailViewModel.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var productSpecs: [String: [String: String]]?
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchProductDetails() {
        isLoading = true
        error = nil
        
        fetchProductDetailsFromAPI { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let specs):
                    self?.productSpecs = specs
                case .failure(let error):
                    self?.error = error
                }
                self?.isLoading = false
            }
        }
    }
    
    private func fetchProductDetailsFromAPI(completion: @escaping (Result<[String: [String: String]], Error>) -> Void) {
       
    }
}

