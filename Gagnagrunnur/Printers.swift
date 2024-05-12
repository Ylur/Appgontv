//
//  Printers.swift
//  Appgo
//  Hvaða upplýsingar erum við að leita af
//  Created by Ingi Haraldss on 7.5.2024.
//

import Foundation
import SwiftUI
import UIKit

struct Printer: Codable, Identifiable {
    let id = UUID()
    var mfgNumber: String
    var brand: String
    var model: String
    var tonerInk: String?
    var maintenanceBox: String?
    var printHead: String?
    var imagingUnit: String?
    var drumUnit: String?

    enum CodingKeys: String, CodingKey {
        case mfgNumber = "Vörunúmer"
        case brand = "Tegund"
        case model = "Undirtegund"
        case tonerInk = "Tóner / Blek"
        case maintenanceBox = "Affallsbox"
        case printHead = "Prenthaus"
        case imagingUnit = "Imaging Unit"
        case drumUnit = "Tromla"
    }
}

