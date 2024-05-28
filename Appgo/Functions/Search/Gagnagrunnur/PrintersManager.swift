//
//  PrintersManager.swift
//  Appgo
//  Les úr Json file
//  Created by Ingi Haraldss on 7.5.2024.
//
import Foundation

    
    class PrintersManager {
        var printers: [Printer] = []
        
        init() {
            loadPrintersFromJSON()
        }
        
        private func loadPrintersFromJSON() {
            guard let url = Bundle.main.url(forResource: "printers", withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                print("Failed to load printers file from bundle.")
                return
            }
            
            do {
                printers = try JSONDecoder().decode([Printer].self, from: data)
                print("Loaded \(printers.count) printers.")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        
        func search(for query: String) -> [Printer] {
            print("Searching for: \(query)")
            let results = printers.filter { printer in
                printer.mfgNumber.localizedCaseInsensitiveContains(query) ||
                printer.model.localizedCaseInsensitiveContains(query) ||
                printer.brand.localizedCaseInsensitiveContains(query) ||
                printer.maintenanceBox!.localizedCaseInsensitiveContains(query) ||
                printer.printHead!.localizedCaseInsensitiveContains(query) ||
                printer.imagingUnit!.localizedCaseInsensitiveContains(query) ||
                printer.drumUnit!.localizedCaseInsensitiveContains(query) ||
                (printer.tonerInk?.localizedCaseInsensitiveContains(query) ?? false)
            }
            print("Search for '\(query)' found \(results.count) results.")
            return results
        }

        
        
        
    }
    
