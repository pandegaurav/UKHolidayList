//
//  Holiday.swift
//  LloydsTest
//
//  Created by Gaurav pande on 07/02/23.
//

import Foundation

// MARK: - Holiday

struct Holiday: Codable {
    let englandAndWales, scotland, northernIreland: EnglandAndWales
    enum CodingKeys: String, CodingKey {
        case englandAndWales = "england-and-wales"
        case scotland = "scotland"
        case northernIreland = "northern-ireland"
    }
}

// MARK: - EnglandAndWales
struct EnglandAndWales: Codable {
    let division: String
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    let title, date: String
    let notes: Notes
    let bunting: Bool
}

enum Notes: String, Codable {
    case empty = ""
    case substituteDay = "Substitute day"
}
