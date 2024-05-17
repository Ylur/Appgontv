//
//  PrintersUI.swift
//  Appgo
// Leitartakkinn og niðurstöður
//  Created by Ingi Haraldss on 7.5.2024.
//

import Foundation
import SwiftUI

struct PrintersUI: View {
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var searchText = "" // Leitartextinn
    @State private var searchResults: [Printer] = [] // Leitar niðurstöður
        
    var printerstManager = PrintersManager() // Uppsetning á leit
    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                                     Image("canon") // canon
                                         .resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(height: 60)
                      
                            
                                 }
                                 .padding(.top)
                    
                    TextField("Settu inn tegund af prentara eða tóner", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Leita") {
                        search() // virkjar leitartakkann
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    List(searchResults, id: \.id) { printer in
                        VStack(alignment: .leading) {
                            Text("\(printer.brand) \(printer.model)")
                                                      .font(.headline)
                                                  Text("Vörunúmer#: \(printer.mfgNumber)")
                                                      .font(.subheadline)
                                                  Text("Tóner/Blek: \(printer.tonerInk ?? "Not available")")
                                                  
                                                  // birtir þessar upplýsingar ef json er ekki tómt
                                                  if let maintenanceBox = printer.maintenanceBox, !maintenanceBox.isEmpty {
                                                      Text("Affallsbox: \(maintenanceBox)")
                                                  }
                                                  if let printHead = printer.printHead, !printHead.isEmpty {
                                                      Text("Prenthaus: \(printHead)")
                                                  }
                                                  if let imagingUnit = printer.imagingUnit, !imagingUnit.isEmpty {
                                                      Text("Imaging Unit: \(imagingUnit)")
                                                  }
                                                  if let drumUnit = printer.drumUnit, !drumUnit.isEmpty {
                                                      Text("Tromla: \(drumUnit)")
                                                  }
                        }
                    }
                    .navigationTitle("Prentvöru leit")
                }
            }
        }

        // Leita og uppfæra UI með upplýsingum
        private func search() {
            let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            searchResults = printerstManager.search(for: trimmedSearchText)
        }
    }
